local Res = require 'test_res'
local CT = require 'ct'


local res_map = {}
local doc = CT.NewDoc()
for key, tbl in pairs(Res) do
    res_map[key] = CT.NewTable(tbl, doc)
end
CT.EncodeDoc(doc)
collectgarbage() -- force gc

print('test index compressed-table:')
assert(res_map['battle_item'][501001]['BuyCostCnt'] == 100)
assert(res_map['battle_item'][501001]['Name'] == "BLOOD_BOTTLE_1")
assert(res_map['battle_item'][501001]['SaleAward'][500001] == 30)
assert(res_map['battle_item'][501001]['CodeKey'] == nil)
assert(res_map['break_cost'][2][2]['Exp'] == 175)
print('test len of compressed-table:')
assert(#res_map['battle_item'][501003]['Arg'] == 3)
assert(#res_map['break_cost'][3] == 51)
assert(#res_map['battle_item'][501005] == 0)
print('test pairs compressed-table:')
for k,v in pairs(res_map['break_cost'][4][1]) do
    print(k, ":", v)
end