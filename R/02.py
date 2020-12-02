# See R code for puzzle info

import re

with open("../input/02-01.txt") as f:
  lines = f.readlines()

# 02-01 -------------------------------------------------------------------

def check1(line):
  
  match = re.search(
    "(?P<min>[^-]+)-(?P<max>[^ ]+) (?P<letter>[^:]+): (?P<password>.*)$",
    line
  )
  
  min = int(match.group("min"))
  max = int(match.group("max"))
  letter = match.group("letter")
  password = ''.join(chr for chr in match.group("password") if chr == letter)
  ct = len(password)
  
  return(
    (ct >= min) & (ct <= max)
  )

sum([ check1(line) for line in lines ])

# 02-02 -------------------------------------------------------------------

def check2(line):
  
  match = re.search(
    "(?P<pos1>[^-]+)-(?P<pos2>[^ ]+) (?P<letter>[^:]+): (?P<password>.*)$",
    line
  )
  
  pos1 = int(match.group("pos1"))
  pos2 = int(match.group("pos2"))
  letter = match.group("letter")
  password = match.group("password")
  
  return(
    ((password[pos1-1] == letter) |
     (password[pos2-1] == letter)) &
     (password[pos1-1] != password[pos2-1])
  )

sum([ check2(line) for line in lines ])
