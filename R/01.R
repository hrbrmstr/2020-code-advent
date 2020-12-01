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

scan(
  file = here::here("../input/01-01.txt"),
  what = integer()
) -> input

pairs <- combn(input, 2)

sums <- combn(input, 2, sum)

Reduce(`*`, pairs[,which(sums == 2020)])

# alternate that is _slightly_ faster (all depends on where the 2020 sum is)

res <- NULL

try(
  combn(input, 2, function(x) {
  if (sum(x) == 2020) {
    res <<- Reduce(`*`, x)
    stop() # we found it so short-circuit the operation
  }
  x
}), silent = TRUE)

res

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

scan(
  file = here::here("../input/01-01.txt"),
  what = integer()
) -> input

tri <- combn(input, 3)

sums <- combn(input, 3, sum)

Reduce(`*`, tri[,which(sums == 2020)])
