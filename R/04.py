from itertools import groupby
import re

with open("../input/04-01.txt") as f:
  input = f.read().splitlines()

req_keys = set([ "byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid" ])

recs = [ ' '.join(list(grp)) for key, grp in groupby(input, lambda str: str != "") if key ]

# 04-01 -------------------------------------------------------------------

def test_fields(rec):
  fields = set(re.findall("([a-z]{3}):", rec))
  return(len(req_keys.difference(fields)) == 0)

sum([ test_fields(rec) for rec in recs ])

# 04-02 -------------------------------------------------------------------

def validate_height(value):
  match = re.match(r"^(?P<val>[0-9]{2,3})(?P<unit>cm|in)$", value)
  val = int(match.group("val"))
  unit = match.group("unit")
  if (unit == "cm"):
    return(150 <= val <= 193)
  else:
    return(59 <= val <= 76)
  
def validate(fval):
  is_valid = {
    "byr": lambda x: re.match(r"^[0-9]{4}$", x) is not None and (1920 <= int(x) <= 2002),
    "iyr": lambda x: re.match(r"^[0-9]{4}$", x) is not None and (2010 <= int(x) <= 2020),
    "eyr": lambda x: re.match(r"^[0-9]{4}$", x) is not None and (2020 <= int(x) <= 2030),
    "hgt": lambda x: re.match(r"^[0-9]{2,3}(cm|in)$", x) is not None and validate_height(x),
    "hcl": lambda x: re.match(r"^#[a-f0-9]{6}$", x)  is not None,
    "ecl": lambda x: x in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"],
    "pid": lambda x: re.match(r"^[0-9]{9}$", x)  is not None
  }
  return(is_valid[fval[0]](fval[1]))


def validate_fields(rec):
  
  fvals = re.findall("([a-z]{3}):([^ $]+)", rec)
  
  fields = set([ x[0] for x in fvals ])
  
  if (len(req_keys.difference(fields)) != 0):
    return(False)
  
  fvals = list(filter(lambda y: y[0] != 'cid', fvals))
  
  res = sum([ validate(x) for x in fvals ]) == 7

  return(res)

sum([ validate_fields(rec) for rec in recs ])







