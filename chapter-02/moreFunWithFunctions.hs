-- moreFunWithFunctions.hs

module MoreFunWithFunctions where

z = 7
x = y ^ 2
y = z + 8

waxOn = x * 5

triple x = x * 3

whereWaxOn = x * 5
  where z = 7
        y = z + 8
        x = y ^ 2

waxOff x = triple x
