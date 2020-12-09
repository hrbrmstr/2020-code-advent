var fs = require("fs")
var combn = require('generatorics') // npm install generatorics

Array.prototype.accumulate = function(ƒ) {
  res = [this[0]]
  for (var idx=1; idx<this.length; idx++) res.push(ƒ(res[idx - 1], this[idx]))
  return(res)
}

// 09-01

input = fs.readFileSync("../input/09-01.txt", "utf-8")
          .split("\n")
          .map((x) => parseInt(x))

//input = [ 35, 20, 15, 25, 47, 40, 62, 55, 65, 95, 102, 117, 150, 182, 127, 219, 299, 277, 309, 576 ]

preamble_length = 25
input_start = preamble_length
condition = true

while(condition && (input.length > (preamble_length))) {

  for (var pair of combn.combination([...Array(preamble_length).keys()], 2)) {
    condition = (input[pair[0]] + input[pair[1]]) == input[input_start]
    if (condition) break
  }

  if (condition) input.shift()

}

invalid = input[input_start]

console.log(invalid)
// 09-02

input = fs.readFileSync("../input/09-01.txt", "utf-8")
          .split("\n")
          .map((x) => parseInt(x))

//input = [ 35, 20, 15, 25, 47, 40, 62, 55, 65, 95, 102, 117, 150, 182, 127, 219, 299, 277, 309, 576 ]

const cumsum = (sum => value => sum += value)(0)

for (var idx=0; idx<input.length; idx++) {

  csum = input.slice(idx, input.length).accumulate((a, b) => a + b)

  if (csum.includes(invalid)) break // 'invalid' comes from part 1

}

rng = input.slice(idx, idx+csum.indexOf(invalid))

console.log(Math.min(...rng) + Math.max(...rng))











