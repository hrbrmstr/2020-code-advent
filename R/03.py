# with open("/tmp/test.txt") as f:
with open("../input/03-01.txt") as f:
  orig_map = f.read().splitlines()

def tree_count(orig_map, slope_x, slope_y):

  m_cols = len(orig_map[0])
  m_rows = len(orig_map)
  
  n_tiles = (slope_x+1) * m_rows // (m_cols)
  
  actual_map = [ row * n_tiles for row in orig_map ]
  
  xpos = 0
  ypos = 0
  n_trees = 0
  
  while True:
    
    xpos = xpos + slope_x
    ypos = ypos + slope_y
    
    if (ypos >= m_rows):
      break
    
    if (actual_map[ypos][xpos] == "#"):
      n_trees = n_trees + 1
  
  return(n_trees)

# 03-01 -------------------------------------------------------------------

tree_count(orig_map, 3, 1)

# 03-02 -------------------------------------------------------------------

from functools import reduce

x = [ 1, 3, 5, 7, 1 ]
y = [ 1, 1, 1, 1, 2 ]

reduce(lambda x, y: x*y, [ tree_count(orig_map, x[idx], y[idx]) for idx in range(len(x)) ])
