var fs = require("fs")

input = fs.readFileSync("../input/05-01.txt", "utf-8")

partition = function(seq, lb, ub, trigger) {

  for (part of seq) {
    amt = Math.floor((ub - lb)/2) + 1
    if (part === trigger) {
      ub -= amt
    } else {
      lb += amt
    }
  }

  return((seq.slice(-1) === trigger) ? ub : lb)

}

res = input
  .split("\n")
  .filter((x) => x.length > 1)
  .map((line) => {

    return(
      (partition(line.substr(0, 7), 0, 127, "F") * 8) +
      partition(line.substr(7, 3), 0, 7, "L")
    )

  }).sort()

// 05-01

console.log(Math.max(...res))

// 05-02

diff = res.map((val, idx, arr) => idx ? val - arr[idx-1] : 0 - val)

console.log(res[diff.findIndex((x) => x > 1)] - 1)
