var fs = require("fs")

Array.prototype.prepend = function() {
  this.unshift(arguments["0"])
  return(this)
}

Set.prototype.difference = function() {
  return(
    new Set([...this].filter(x => !arguments["0"].has(x)))
  )
}

Number.prototype.between = function(a, b) {
  min = Math.min.apply(Math, [a, b]),
  max = Math.max.apply(Math, [a, b]);
  return(this >= min && this <= max)
};

  req_keys = new Set([ "byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid" ])

input = []

input = fs.readFileSync("../input/04-01.txt", "utf-8")
// input = fs.readFileSync("/tmp/test.txt", "utf-8")
  .split("\n")
  .prepend("")
  .reduce((recs, line) => {
    (line == "") ? recs.push([line]) : recs[recs.length - 1].push(line)
    return(recs)
  }, [])
  .filter((x) => x.length > 1)
  .map((x) => x.filter((val) => val != "")
               .join(" ")
               .split(" ")
               .filter((x) => !RegExp('^cid').test(x))
               .reduce((kv, line) => {
                 [k, v] = line.split(":")
                 kv[k] = v
                 return(kv)
               }, {})
  )

// 04-01

console.log(
  input.map((x) => req_keys.difference(new Set(Object.keys(x))))
  .filter((x) => x.size == 0)
  .length
)

// 04-02

hair_colors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

validate_height = function(x) {

  val = parseInt(x.replace(/(in|cm)/g, ""))
  unit = x.replace(/[0-9]/g, "")

  return(unit == "in" ? val.between(59, 76) : val.between(150, 193))

}

console.log(
  input
    .filter((x) => req_keys.difference(new Set(Object.keys(x))).size == 0)
    .filter((x) =>
      Object.entries(x).filter((kv) => {
        switch(kv[0]) {
          case "byr" : res = RegExp('^[0-9]{4}$').test(kv[1]) &&
                             parseInt(kv[1]).between(1920, 2002)
                             break
          case "iyr" : res = RegExp('^[0-9]{4}$').test(kv[1]) &&
                             parseInt(kv[1]).between(2010, 2020)
                             break
          case "eyr" : res = RegExp('^[0-9]{4}$').test(kv[1]) &&
                             parseInt(kv[1]).between(2020, 2030)
                             break
          case "hgt" : res = RegExp('^[0-9]{2,3}(cm|in)$').test(kv[1]) &&
                             validate_height(kv[1])
                             break
          case "hcl" : res = RegExp('^#[a-f0-9]{6}$').test(kv[1])
                             break
          case "ecl" : res = hair_colors.includes(kv[1])
                             break
          case "pid" : res = RegExp('^[0-9]{9}$').test(kv[1])
                             break
        }
        return(res)
      }).length == 7
    ).length
)
