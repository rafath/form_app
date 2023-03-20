const sum = require('./../../app/javascript/calculator.js');


test('adds 1 + 5 to equal 6', () => {
  expect(sum(1, 5)).toBe(6);
  expect(sum(1)(5)).toBe(6);
});
