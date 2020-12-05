from itertools import groupby
import re

# with open("/tmp/test.txt") as f:
with open("../input/04-01.txt") as f:
  input = f.read().splitlines()

req_keys = set([ "byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid" ])

recs = [ ' '.join(list(grp)) for key, grp in groupby(input, lambda str: str != "") if key ]

def test_fields(rec):
  fields = set(re.findall("([a-z]{3}):", rec))
  return(len(req_keys.difference(fields)) == 0)

sum([ test_fields(rec) for rec in recs ])

