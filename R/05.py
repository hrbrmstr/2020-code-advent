import math
import numpy as np  

with open("../input/05-01.txt") as f:
  input = f.read().splitlines()

def partition(seq, lb, ub, trigger):
  
  for idx, part in enumerate(seq):
    amt = math.floor((ub - lb)/2) + 1
    if (part == trigger):
      ub -= amt
    else:
      lb += amt
  
  return(ub if (seq[-1] == trigger) else lb)


def get_seat(x):
  return(
    (partition(x[0:7],  0, 127, "F") * 8) + 
     partition(x[7:10], 0,   7, "L") 
  )

res = [ get_seat(bpass) for bpass in input ]

# 05-01

res.sort()

max(res)

# 05-02

idx = np.where(np.diff(res) > 1)

res[idx[0][0]] + 1

