var fs = require("fs")

Array.prototype.prepend = function() {
  this.unshift(arguments["0"])
  return(this)
}

// 06-01

res = input = fs.readFileSync("../input/06-01.txt", "utf-8")
  .split("\n")
  .prepend("")
  .reduce((recs, line) => {
    (line == "") ? recs.push([line]) : recs[recs.length - 1].push(line)
    return(recs)
  }, [])
  .filter((x) => x.length > 1)
  .map((x) => x.filter((y) => y != "")
               .map((y) => y.split(""))
               .flat()
  )
  .map((x) => (new Set(x)).size)
  .reduce((a, b) => a + b)

console.log(res)

// 06-02

res = input = fs.readFileSync("../input/06-01.txt", "utf-8")
  .split("\n")
  .prepend("")
  .reduce((recs, line) => {
    (line == "") ? recs.push([line]) : recs[recs.length - 1].push(line)
    return(recs)
  }, [])
  .filter((x) => x.length > 1)
  .map((x) => x.filter((y) => y != "")
               .map((y) => y.split(""))
  )
  .map((x) => {
    map = x.flat().reduce((acc, e) => acc.set(e, (acc.get(e) || 0) + 1), new Map())
    return([...map.values()].filter((v) => v == x.length).length)
  })
  .reduce((a, b) => a + b)

console.log(res)
