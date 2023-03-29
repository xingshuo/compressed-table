# CompressedTable
* 一种用查询效率换取存储空间的表的实现，可以像[]访问和pairs遍历普通lua table一样操作它
* 一种可能的应用场景：游戏资源配置表
* 经线上项目配置资源实测：CompressedTable内存占用仅为lua table的30 ~ 40%，[]查询效率比lua table慢约100倍，pairs遍历比lua table慢约10倍

## Reference
* https://github.com/cloudwu/skynet/blob/master/lualib/skynet/datasheet/dump.lua#L41

## Compressed Format
```
table:
  int32 array_n
  int32 dict_n
  int32 dict_ikey_n
  int8*(array_n + dict_n + dict_ikey_n) type (align 4)
  value* array
  kvpair* dict
kvpair:
  string/int32 k
  value v
value: (union)
  int32 integer
  float real
  int32 boolean
  int32 table index
  int32 string id
type: (enum)
  1 integer
  2 real
  3 boolean
  4 table
  5 string
```

## Test
* lua test.lua