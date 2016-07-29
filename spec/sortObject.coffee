
sortObject = require "sortObject"

describe "sortObject()", ->

  it "sorts an object based on the comparison function", ->

    obj = { c: 1, b: 2, a: 3 }
    result = sortObject obj, (a, b) ->
      if a.key > b.key then 1 else -1

    expect Object.keys(result)
      .toEqual [ "a", "b", "c" ]

  it "can sort by values, for example", ->

    obj = { Bob: 50, Sharon: 100, Steve: 25 }
    result = sortObject obj, (a, b) ->
      if a.value > b.value then 1 else -1

    expect Object.keys(result)
      .toEqual [ "Steve", "Bob", "Sharon" ]

  it "always returns a new object", ->

    obj = { b: 1, a: 1 }
    result = sortObject obj, (a, b) ->
      if a.key > b.key then 1 else -1

    expect result
      .not.toBe obj

  it "always returns an object of the same type", ->

    obj = Object.create null
    obj.c = 1
    obj.b = 1
    obj.a = 1

    result = sortObject obj, (a, b) ->
      if a.key > b.key then 1 else -1

    expect Object.getPrototypeOf(result)
      .toBe undefined

    result = sortObject { a: 2, b: 1 }, (a, b) ->
      if a.value > b.value then 1 else -1

    expect Object.getPrototypeOf(result)
      .tobe Object.prototype
