var sortObject;

sortObject = require("sortObject");

describe("sortObject()", function() {
  it("sorts an object based on the comparison function", function() {
    var obj, result;
    obj = {
      c: 1,
      b: 2,
      a: 3
    };
    result = sortObject(obj, function(a, b) {
      if (a.key > b.key) {
        return 1;
      } else {
        return -1;
      }
    });
    return expect(Object.keys(result)).toEqual(["a", "b", "c"]);
  });
  it("can sort by values, for example", function() {
    var obj, result;
    obj = {
      Bob: 50,
      Sharon: 100,
      Steve: 25
    };
    result = sortObject(obj, function(a, b) {
      if (a.value > b.value) {
        return 1;
      } else {
        return -1;
      }
    });
    return expect(Object.keys(result)).toEqual(["Steve", "Bob", "Sharon"]);
  });
  it("always returns a new object", function() {
    var obj, result;
    obj = {
      b: 1,
      a: 1
    };
    result = sortObject(obj, function(a, b) {
      if (a.key > b.key) {
        return 1;
      } else {
        return -1;
      }
    });
    return expect(result).not.toBe(obj);
  });
  return it("always returns an object of the same type", function() {
    var obj, result;
    obj = Object.create(null);
    obj.c = 1;
    obj.b = 1;
    obj.a = 1;
    result = sortObject(obj, function(a, b) {
      if (a.key > b.key) {
        return 1;
      } else {
        return -1;
      }
    });
    expect(Object.getPrototypeOf(result)).toBe(void 0);
    result = sortObject({
      a: 2,
      b: 1
    }, function(a, b) {
      if (a.value > b.value) {
        return 1;
      } else {
        return -1;
      }
    });
    return expect(Object.getPrototypeOf(result)).tobe(Object.prototype);
  });
});

//# sourceMappingURL=../../map/spec/sortObject.map
