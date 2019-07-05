-- rewrites.hs
module Rewrites where

-- Exercise 1
letCluseOne =
  let x = 3
      y = 1000
  in x * 3 + y

whereClauseOne = x * 3 + y
  where x = 3
        y = 1000

exercise01 = letCluseOne == whereClauseOne

-- Exercise 2
letClauseTwo =
  let y = 10
      x = 10 * 5 + y
  in x * 5

whereClauseTwo = x * 5
  where y = 10
        x = 10 * 5 + y

exercise02 = letClauseTwo == whereClauseTwo

-- Exercise 3
letClauseThree =
  let x = 7
      y = negate x
      z = y * 10
  in z / x + y

whereClauseThree = z / x + y
  where x = 7
        y = negate x
        z = y * 10

exercise03 = letClauseThree == whereClauseThree
