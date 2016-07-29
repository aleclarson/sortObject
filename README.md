
# sortObject 1.0.0 ![stable](https://img.shields.io/badge/stability-stable-4EBA0F.svg?style=flat)

```coffee
sortObject = require "sortObject"

obj = { c: 1, b: 1, a: 1 }

result = sortObject obj, (a, b) ->
  if a.key > b.key then 1 else -1

Object.keys(result) # => [ "a", "b", "c" ]
```
