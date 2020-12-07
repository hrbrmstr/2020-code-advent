var fs = require("fs")

input = fs.readFileSync("../input/05-01.txt", "utf-8")

res = input
  .split("\n")
  .filter((x) => x.length > 1)
  .map((line) => {

    lb = 0
    ub = 127

    for (part of line.substr(0, 7)) {
      amt = Math.floor((ub - lb)/2) + 1
      if (part === "F") {
        ub -= amt
      } else {
        lb += amt
      }
    }

    row = (line.charAt(6) === "F") ? lb : ub

    lb = 0
    ub = 7

    for (part of line.substr(7, 3)) {
      amt = Math.floor((ub - lb)/2) + 1
      if (part === "L") {
        ub -= amt
      } else {
        lb += amt
      }
    }

    seat = (line.charAt(9) === "R") ? lb : ub

    return((row * 8) + seat)

  }).sort()

// 05-01

console.log(Math.max(...res))

// 05-02

diff = res.map((val, idx, arr) => idx ? val - arr[idx-1] : 0 - val)

console.log(res[diff.findIndex((x) => x > 1)] - 1)
