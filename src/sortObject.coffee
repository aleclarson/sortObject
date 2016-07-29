
SortedArray = require "sorted-array"
PureObject = require "PureObject"
assertType = require "assertType"
isType = require "isType"

# TODO: Implement this more efficiently?
module.exports = (obj, compare) ->

  assertType obj, [ Object, PureObject ]

  pairs = SortedArray [], compare
  pairs.insert { key, value } for key, value of obj

  result =
    if isType obj, PureObject
      Object.create null
    else {}

  result[key] = value for { key, value } in pairs.array
  return result
