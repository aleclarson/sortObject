var Objectlike, PureObject, SortedArray, Typle, assertType;

SortedArray = require("sorted-array");

PureObject = require("PureObject");

assertType = require("assertType");

Typle = require("Typle");

Objectlike = Typle([Object, PureObject]);

module.exports = function(obj, compare) {
  var i, key, len, pairs, ref, ref1, result, value;
  assertType(obj, Objectlike);
  pairs = SortedArray([], compare);
  for (key in obj) {
    value = obj[key];
    pairs.insert({
      key: key,
      value: value
    });
  }
  result = PureObject.test(obj) ? Object.create(null) : {};
  ref = pairs.array;
  for (i = 0, len = ref.length; i < len; i++) {
    ref1 = ref[i], key = ref1.key, value = ref1.value;
    result[key] = value;
  }
  return result;
};

//# sourceMappingURL=map/sortObject.map
