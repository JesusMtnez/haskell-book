# Chapter 8: Recursion

## Chapter Exercises

### Review of types

1. `[[True, False], [True, True], [False, True]]` has type `[[Bool]]`
2. `[[True, False], [True, True], [False, True]]` has the same type as `[[3 == 3], [6 > 5], [3 < 4]]`
3. d) _all of the above_
4. b) `func "Hello" "World"`

### Reviewing currying

``` haskell
cattyConny :: String -> String -> String
cattyConny x y = x ++ "mrow" ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"
```

1. `appedCatty "woohoo!"` value is `woopsmrowwoohoo!`
2. `frappe "1"` value is `1mrowhaha`
3. `frappe (appedCatty "2")` value is `woopsmrow2mrowhaha`
4. `appedCatty (frappe "blue")` value is `woopsmrowbluemrowhaha`
5. `cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))` value is `pinkmrowhahamrowgreenmrowwoopsmrowblue`
6. `cattyConny (flippy "Pugs" "are") "awesome"` value is `aremrowPugsmrowawesome`

### Recursion

1. The steps are:

``` haskell
15 dividedBy 2 == 15 - 2, 13
                     - 2, 11
                     - 2, 9
                     - 2, 7
                     - 2, 5
                     - 2, 3
                     - 2, 1
-- 1 is less than 2, so we stopped.
-- We subtracted 7 times, so 15 / 2 == 7
```

2. Write a function that recursively sums all numbers from 1 to `n`, `n` being the argument.

``` haskell
sumAllTo :: (Eq a, Num a) => a -> a
sumAllTo 1 = 1
sumAllTo n = n + sumAllTo(n - 1)
```

3. Write a function that multiplies two integral numbers using recursive summation.

``` haskell
mul :: Integral a => a -> a -> a
mul 0 _ = 0
mul _ 0 = 0
mul x y = (+) x $ mul x (y - 1)
```

### Fixing dividedBy

See solution here: [`dividedBy.hs`](dividedBy.hs))

### McCarthy 91 function

See solution here: [`mccarthy91.hs`](mccarthy91.hs)

### Numbers into Words

See solution here: [`numbers2words.hs`](numbers2words.hs)

[dividedBy.hs](/dividedBy.hs)
[mccarthy91.hs](/mccarthy91.hs)
[numbers2words.hs](/numbers2words.hs)
