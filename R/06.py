from itertools import groupby
from collections import Counter

with open("../input/06-01.txt") as f:
  input = f.read().splitlines()

flatten = lambda x: [item for sublist in x for item in sublist]

count01 = lambda x: len(set([chr for chr in x]))

# 06-01

sum([ count01(flatten(list(grp))) for key, grp in groupby(input, lambda str: str != "") if key ])

# 06-02

count02 = lambda x: len([ val for val in Counter(flatten(x)).values() if val == len(x)])
  
sum([ count02(list(grp)) for key, grp in groupby(input, lambda str: str != "") if key ])

