// See R code for the problem texts

// 02-01

var fs = require("fs")

input = fs.readFileSync("../input/02-01.txt", "utf-8")
  .split("\n")


const re1 = /(?<min>[^-]+)-(?<max>[^ ]+) (?<letter>[^:]+): (?<password>.*)$/;

res = input.map((line) => {

  g = re1.exec(line).groups

  g.min = parseInt(g.min)
  g.max = parseInt(g.max)

  ltr_re = new RegExp("[^" + g.letter + "]", "g")
  g.password = g.password.replace(ltr_re, "")

  return(
    (g.password.length >= g.min) &
     (g.password.length <= g.max)
  )

}).reduce((a, b) => a + b)

console.log(res)

// 02-02

const re2 = /(?<pos1>[^-]+)-(?<pos2>[^ ]+) (?<letter>[^:]+): (?<password>.*)$/;

res = input.map((line) => {

  g = re2.exec(line).groups

  g.pos1 = parseInt(g.pos1)
  g.pos2 = parseInt(g.pos2)

  return(((g.password[g.pos1-1] == g.letter) |
   (g.password[g.pos2-1] == g.letter)) &
   (g.password[g.pos1-1] != g.password[g.pos2-1]))

}).reduce((a, b) => a + b)

console.log(res)
