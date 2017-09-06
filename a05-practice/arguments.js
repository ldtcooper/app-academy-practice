// function sum() {
//   let sumSoFar = 0;
//   let nums = Array.from(arguments);
//   for (var i = 0; i < nums.length; i++) {
//     sumSoFar += nums[i];
//   }
//   return sumSoFar;
// }

Function.prototype.myBind = function (newThis, ...outerArgs) {
  return (...innerArgs) => {
    return this.apply(newThis, outerArgs.concat(innerArgs));
  };
};

function curriedSum(numArgs) {
  let numbers = [];
  function _curriedSum(n) {
    numbers.push(n);
    if (numbers.length === numArgs) {
      let s = 0;
      numbers.forEach( (el => {
        s += el;
      }));
      return s;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

Function.prototype.curry = function (numArgs) {
  let numbers = [];
  let fn = this;
  function _curriedFunc(n) {
    numbers.push(n);
    if (numbers.length === numArgs) {
      return fn.apply(null, numbers);
    } else {
      return _curriedFunc;
    }
  }
  return _curriedFunc;
};
