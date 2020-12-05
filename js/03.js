var fs = require("fs")

orig_map = fs.readFileSync("../input/03-01.txt", "utf-8")
  .split("\n")
  .filter((line) => line != '')

count_trees = function(orig_map, slope_x, slope_y) {

  m_cols = orig_map[0].length
  m_rows = orig_map.length

  n_tiles = Math.floor((slope_x+1) * m_rows / (m_cols))

  actual_map = orig_map.map((row) => {
    return(row.repeat(n_tiles))
  })

  xpos = 0
  ypos = 0
  n_trees = 0

  while(true) {

    xpos += slope_x
    ypos += slope_y

    if (ypos >= m_rows) break

    if (actual_map[ypos][xpos] == "#") n_trees += 1

  }

  return(n_trees)


}

// 03-01

console.log(count_trees(orig_map, 3, 1))

// 03-02

x = [ 1, 3, 5, 7, 1 ]
y = [ 1, 1, 1, 1, 2 ]

console.log(
  [...Array(x.length).keys()]
    .map((idx) => count_trees(orig_map, x[idx], y[idx]))
    .reduce((a, b) => a * b)
)
