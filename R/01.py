# https://adventofcode.com/2020

# Day 01 - 01 -------------------------------------------------------------

# Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.
#
# Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.
#
# For example, suppose your expense report contained the following:
#
# 1721
# 979
# 366
# 299
# 675
# 1456
# In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.
#
# Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?

import itertools
from functools import reduce

with open("../input/01-01.txt") as f:
  lines = f.readlines()
  input_vals = [ int(val) for val in lines ]

pairs = list(itertools.combinations(input_vals, 2))

sums = [ sum(vals) for vals in pairs ]

reduce(lambda x, y: x*y, pairs[sums.index(2020)])

# Day 01 - 02 -------------------------------------------------------------

# Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.
#
# Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.
#
# For example, suppose your expense report contained the following:
#
# 1721
# 979
# 366
# 299
# 675
# 1456
# In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.
#
# Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?

import itertools
from functools import reduce

with open("../input/01-01.txt") as f:
  lines = f.readlines()
  input_vals = [ int(val) for val in lines ]

tri = list(itertools.combinations(input_vals, 3))

sums = [ sum(vals) for vals in tri ]

reduce(lambda x, y: x*y, tri[sums.index(2020)])

