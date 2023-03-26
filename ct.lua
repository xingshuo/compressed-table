
local M = {}

function M.New(root)
    local doc = {
		table_n = 0,
		table = {},
		strings = {},
		string_id = 0,
	}
	local function dump_table(t)
		local index = doc.table_n + 1
		doc.table_n = index
		doc.table[index] = false	-- place holder
		local array_n = 0
		local array = {}
		local kvs = {}
		local types = {}
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
                local sid = doc.strings[v]
                if not sid then
                    sid = doc.string_id + 1
                    doc.string_id = sid
                    doc.strings[v] = sid
                    table.insert(doc.strings, v)
                end
				return '\5', string.pack("<I4", sid)
			else
				error ("Unsupport value " .. tostring(v))
			end
		end
		for i,v in ipairs(t) do
			types[i], array[i] = encode(v)
			array_n = i
		end
		for k,v in pairs(t) do
			if type(k) == "string" then
				local _, kv = encode(k)
				local tv, vv = encode(v)
				table.insert(types, tv)
				table.insert(kvs, kv .. vv)
			else
				local ik = math.tointeger(k)
				assert(ik and ik > 0 and ik <= array_n)
			end
		end
		-- encode table
		local typeset = table.concat(types)
		local align = string.rep("\0", (4 - #typeset & 3) & 3)
		local tmp = {
			string.pack("<I4I4", array_n, #kvs),
			typeset,
			align,
			table.concat(array),
			table.concat(kvs),
		}
		doc.table[index] = table.concat(tmp)
		return index
	end

	dump_table(root)

	local function gen_proxytable (stable)
		local function value(t, pos)
			if t == 1 then -- integer
				return string.unpack("<i4", stable, pos)
			elseif t == 2 then -- float
				return string.unpack("<f", stable, pos)
			elseif t == 3 then -- boolean
				return string.unpack("<i4", stable, pos) ~= 0
			elseif t == 4 then -- table
				local tindex = string.unpack("<i4", stable, pos)
				local tstr = assert(doc.table[tindex], tindex)
				return gen_proxytable(tstr)
			elseif t == 5 then -- string
				local sid = string.unpack("<I4", stable, pos)
				local str = assert(doc.strings[sid], sid)
				return str
			else
				error (string.format("Invalid data at %d (%d)", pos, t))
			end
		end

		local mt = setmetatable({}, {
			__index = function (_, k)
				local array_n, dict_n, offset = string.unpack("<I4I4", stable)
				local typeslen = array_n + dict_n
				if typeslen % 4 ~= 0 then
					typeslen = typeslen + (4 - typeslen % 4)
				end

				if type(k) == 'number' then
					local ik = math.tointeger(k)
					assert(ik and ik > 0 and ik <= array_n)
					local vt = string.unpack("B", stable, offset + ik - 1)
					local vpos = offset + typeslen + (ik-1)*4
					return value(vt, vpos)
				elseif type(k) == 'string' then
					local ksid = doc.strings[k]
					if not ksid then
						return nil
					end
					local base = offset + typeslen + array_n*4
					for i = 1, dict_n do
						local kpos = base + (i - 1) * 8
						local sid, vpos = string.unpack("<I4", stable, kpos)
						if sid == ksid then
							local vt = string.unpack("B", stable, offset + array_n + i - 1)
							return value(vt, vpos)
						end
					end
				else
					error("invalid key type: " .. type(k))
				end
			end,
			__pairs = function ()
				local array_n, dict_n, offset = string.unpack("<I4I4", stable)
				local typeslen = array_n + dict_n
				if typeslen % 4 ~= 0 then
					typeslen = typeslen + (4 - typeslen % 4)
				end
				local types = { string.unpack(string.rep("B", (array_n + dict_n)), stable, offset) }
				local result = {}
				for i=1, array_n do
					local v = value(types[i], offset + typeslen + (i-1)*4)
					table.insert(result, v)
				end

				local base = offset + typeslen + array_n*4
				for i=1, dict_n do
					local kpos = base + (i - 1) * 8
					local sid, vpos = string.unpack("<I4", stable, kpos)
					local k = assert(doc.strings[sid], sid)
					local vt = string.unpack("B", stable, offset + array_n + i - 1)
					result[k] = value(vt, vpos)
				end

				return next, result
			end
		})

		return mt
	end

    local ct = gen_proxytable(doc.table[1])
	collectgarbage()
	return ct
end

return M