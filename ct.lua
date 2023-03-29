
local M = {}

function M.NewDoc()
	local doc = {
		table_n = 0,
		table = {},
		strings = {},
		string_id = 0,
	}
	return doc
end

function M.NewTable(root, doc)
	assert(doc, 'doc needed!')
	assert(doc.table, 'invalid doc, maybe encoded!')
	local function dump_table(t)
		local index = doc.table_n + 1
		doc.table_n = index
		doc.table[index] = false	-- place holder
		local array_n = 0
		local array = {}
		local kvs = {}
		local types = {}
		local function get_string_id(v)
			local sid = doc.strings[v]
			if not sid then
				sid = doc.string_id + 1
				doc.string_id = sid
				doc.strings[v] = sid
				table.insert(doc.strings, v)
			end
			return sid
		end
		local function encode(v)
			local t = type(v)
			if t == "table" then
				local index = dump_table(v)
				return '\4', string.pack("<i4", index)
			elseif t == "number" then
				if math.tointeger(v) and v <= 0x7FFFFFFF and v >= -(0x7FFFFFFF+1) then
					return '\1', string.pack("<i4", v)
				else
					return '\2', string.pack("<f",v)
				end
			elseif t == "boolean" then
				if v then
					return '\3', "\0\0\0\1"
				else
					return '\3', "\0\0\0\0"
				end
			elseif t == "string" then
				local sid = get_string_id(v)
				return '\5', string.pack("<I4", sid)
			else
				error ("Unsupport value " .. tostring(v))
			end
		end

		for i,v in ipairs(t) do
			types[i], array[i] = encode(v)
			array_n = i
		end

		local keylist = {}
		local dict_ikey_n = 0
		for k in pairs(t) do
			if type(k) == "string" then
				table.insert(keylist, k)
			else
				local ik = math.tointeger(k)
				assert(ik and ik >= -(0x7FFFFFFF+1) and ik <= 0x7FFFFFFF, k)
				if ik <= 0 or ik > array_n then
					table.insert(keylist, k)
					dict_ikey_n = dict_ikey_n + 1
				end
			end
		end

		table.sort(keylist, function (ka, kb)
			local ta = type(ka)
			local tb = type(kb)
			if ta ~= tb then
				return tb == "string"
			end
			if ta == "string" then
				local ia = get_string_id(ka)
				local ib = get_string_id(kb)
				return ia < ib
			else
				return ka < kb
			end
		end)
		for _,k in ipairs(keylist) do
			local _, kv = encode(k)
			local v = t[k]
			local vt, vv = encode(v)
			table.insert(types, vt)
			table.insert(kvs, kv .. vv)
		end
		-- encode table
		local typeset = table.concat(types)
		local align = string.rep("\0", (4 - #typeset & 3) & 3)
		local tmp = {
			string.pack("<I4I4I4", array_n, #kvs, dict_ikey_n),
			typeset,
			align,
			table.concat(array),
			table.concat(kvs),
		}
		doc.table[index] = table.concat(tmp)
		return index
	end

	local index = dump_table(root)

	local function get_tablestr(tindex)
		assert(doc.tindex_str and (1 <= tindex and tindex <= #doc.tindex_str//4), tindex)
		
		local offset = string.unpack("<I4", doc.tindex_str, (tindex - 1)*4 + 1)
		if tindex*4 == #doc.tindex_str then
			return doc.table_str:sub(offset + 1)
		end
		local nxt_off = string.unpack("<I4", doc.tindex_str, tindex*4 + 1)
		return doc.table_str:sub(offset + 1, nxt_off)
	end

	local function gen_proxytable (tstr)
		local function value(t, pos)
			if t == 1 then -- integer
				return string.unpack("<i4", tstr, pos)
			elseif t == 2 then -- float
				return string.unpack("<f", tstr, pos)
			elseif t == 3 then -- boolean
				return string.unpack("<i4", tstr, pos) ~= 0
			elseif t == 4 then -- table
				local tindex = string.unpack("<i4", tstr, pos)
				return gen_proxytable(get_tablestr(tindex))
			elseif t == 5 then -- string
				local sid = string.unpack("<I4", tstr, pos)
				local str = assert(doc.strings[sid], sid)
				return str
			else
				error (string.format("Invalid data at %d (%d)", pos, t))
			end
		end

		local mt = setmetatable({}, {
			__index = function (_, k)
				local array_n, dict_n, dict_ikey_n, offset = string.unpack("<I4I4I4", tstr)
				local typeslen = array_n + dict_n
				if typeslen % 4 ~= 0 then
					typeslen = typeslen + (4 - typeslen % 4)
				end
				local t = type(k)

				if t == 'number' then
					local ik = math.tointeger(k)
					assert(ik and ik >= -(0x7FFFFFFF+1) and ik <= 0x7FFFFFFF)
					if ik <= 0 or ik > array_n then -- hash part, binary search
						local base = offset + typeslen + array_n*4
						local low = 1
						local high = dict_ikey_n
						while low <= high do
							local mid = (low + high)//2
							local kpos = base + (mid - 1) * 8
							local num, vpos = string.unpack("<i4", tstr, kpos)
							if num == ik then
								local vt = string.unpack("B", tstr, offset + array_n + mid - 1)
								return value(vt, vpos)
							end
							if num < ik then
								low = mid + 1
							else
								high = mid - 1
							end
						end
						return nil
					else
						local vt = string.unpack("B", tstr, offset + ik - 1)
						local vpos = offset + typeslen + (ik-1)*4
						return value(vt, vpos)
					end
				elseif t == 'string' then
					local ksid = doc.strings[k]
					if not ksid then
						return nil
					end
					-- binary search
					local base = offset + typeslen + array_n*4
					local low  = dict_ikey_n + 1
					local high = dict_n
					while low <= high do
						local mid = (low + high)//2
						local kpos = base + (mid - 1) * 8
						local sid, vpos = string.unpack("<I4", tstr, kpos)
						if sid == ksid then
							local vt = string.unpack("B", tstr, offset + array_n + mid - 1)
							return value(vt, vpos)
						end
						if sid < ksid then
							low = mid + 1
						else
							high = mid - 1
						end
					end
					return nil
				else
					error("invalid key type: " .. type(k))
				end
			end,
			__pairs = function ()
				local array_n, dict_n, dict_ikey_n, offset = string.unpack("<I4I4I4", tstr)
				local typeslen = array_n + dict_n
				if typeslen % 4 ~= 0 then
					typeslen = typeslen + (4 - typeslen % 4)
				end
				local types = { string.unpack(string.rep("B", (array_n + dict_n)), tstr, offset) }
				local result = {}
				for i=1, array_n do
					local v = value(types[i], offset + typeslen + (i-1)*4)
					table.insert(result, v)
				end

				local base = offset + typeslen + array_n*4
				for i=1, dict_ikey_n do
					local kpos = base + (i - 1) * 8
					local k, vpos = string.unpack("<i4", tstr, kpos)
					local vt = types[array_n + i]
					result[k] = value(vt, vpos)
				end
				for i=dict_ikey_n + 1, dict_n do
					local kpos = base + (i - 1) * 8
					local sid, vpos = string.unpack("<I4", tstr, kpos)
					local k = assert(doc.strings[sid], sid)
					local vt = types[array_n + i]
					result[k] = value(vt, vpos)
				end

				return next, result
			end,
			__len = function ()
				local array_n = string.unpack("<I4", tstr)
				return array_n
			end
		})

		return mt
	end

	local tstr = assert(doc.table[index], index)
	return gen_proxytable(tstr)
end

function M.EncodeDoc(doc)
	assert(doc.table)
	local index = {}
	local offset = 0
	for i, v in ipairs(doc.table) do
		index[i] = string.pack("<I4", offset)
		offset = offset + #v
	end
	doc.table_str = table.concat(doc.table)
	doc.tindex_str = table.concat(index)
	doc.table = nil
end

return M