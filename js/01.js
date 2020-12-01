// See R or Python code for the problems

// 01-01

var fs = require("fs")
var combn = require('generatorics') // npm install generatorics

input = fs.readFileSync("../input/01-01.txt", "utf-8")
  .split("\n")
  .map(Number)

for (var pair of combn.combination(input, 2)) {
  res = pair.reduce((a, b) => a+b)
  if (res == 2020) {
    console.log(pair.reduce((a, b) => a*b))
    break
  }
}

// 01-02

for (var pair of combn.combination(input, 3)) {
  res = pair.reduce((a, b) => a+b)
  if (res == 2020) {
    console.log(pair.reduce((a, b) => a*b))
    break
  }
}
