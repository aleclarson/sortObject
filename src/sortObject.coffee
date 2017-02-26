
SortedArray = require "SortedArray"
PureObject = require "PureObject"
assertType = require "assertType"
Typle = require "Typle"

Objectlike = Typle [ Object, PureObject ]

defaultCompare = (a, b) ->
  if a.key > b.key
  then 1 else -1

module.exports = (obj, compare = defaultCompare) ->

  assertType obj, Objectlike

  pairs = SortedArray [], compare
  for key, value of obj
    pairs.insert {key, value}

  clone =
    if PureObject.test obj
      Object.create null
    else {}

  for {key, value} in pairs.array
    clone[key] = value

  return clone
