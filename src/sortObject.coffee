
SortedArray = require "SortedArray"
PureObject = require "PureObject"
assertType = require "assertType"
Either = require "Either"

Sortable = Either Object, PureObject

module.exports =
sortObject = (obj, compare = defaultCompare) ->

  assertType obj, Sortable

  pairs = SortedArray [], compare
  for key, value of obj
    pairs.insert {key, value}

  clone =
    if PureObject.test obj
    then Object.create null
    else {}

  for {key, value} in pairs.array
    clone[key] = value

  return clone

defaultCompare = (a, b) ->
  if a.key > b.key
  then 1 else -1
