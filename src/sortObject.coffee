
SortedArray = require "sorted-array"
PureObject = require "PureObject"
assertType = require "assertType"
Typle = require "Typle"

Objectlike = Typle [ Object, PureObject ]

# TODO: Implement this more efficiently?
module.exports = (obj, compare) ->

  assertType obj, Objectlike

  pairs = SortedArray [], compare
  pairs.insert { key, value } for key, value of obj

  result =
    if PureObject.test obj
      Object.create null
    else {}

  result[key] = value for { key, value } in pairs.array
  return result
