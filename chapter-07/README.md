# Chapter 7: More functional patterns

## Exercises: Grab Bag

1. The four of them are equivalent.
2. The type of `mTh 3` would be `Num a => a -> a -> a`
3. Rewrite using anonymous lambda syntax

``` haskell
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f n = n + 1

addOneIfOdd n = case odd n of
  True -> n
  False -> n
  where f = (\x -> x + 1)
```

``` haskell
addFive x y = (if x > y then y else x) + 5

addFive = \x -> \y -> (if x > y then y else x) + 5
```

``` haskell
mflip f = \x -> \y -> f y x

mflip f x y = f y x
```

## Exercises: Variety Pack

1. `k` type is `k :: (a, b) -> a`.
   `k2` type is `String`.
   `k1` and `k3` have the same type.
   Both `k1` and `k3` will return `3`.

2. Fill the definition

``` haskell
f :: (a, b, c) -> (d, e, f) -> ((a d), (c, f))

f (a, _, c) (d, _, f) = ((a, d), (c, f))
```

## Exercises: Case Practice

1. The following should return x when x is greater than y.
``` haskell
functionC x y = if (x > y) then x else y

functionC x y =
  case x > y of
    True -> x
    False -> y
```

2. The following will add 2 to even numbers and otherwise simply return the input value.
``` haskell
ifEvenAdd2 n = if even n then (n + 2) else n

ifEvenAdd2 n =
  case even n of
    True -> n + 2
    False -> n
```

3. The following compares a value, x, to zero and returns an indicator for whether x is a positive number or negative number. What if x is 0?
``` haskell
nums x =
  case compare x 0 of
    LT -> -1
    GT -> 1
    EQ -> 0
```

## Exercises: Artful Dodgy

1. `dodgy 1 0` is `1`
2. `dodgy 1 1` is `11`
3. `dodgy 2 2` is `22`
4. `dodgy 1 2` is `21`
5. `dodgy 2 1` is `12`
6. `oneIsOne 1` is `11`
7. `oneIsOne 2` is `21`
8. `oneIsTwo 1` is `21`
9. `oneIsTwo 2` is `22`
10. `oneIsOne 3` is `13`
11. `oneIsTwo 3` is `23`

## Exercises: Guard Duty

1. What happens now if you pass a 90 as an argument? 75? 60?

``` haskell
avgGrade :: (Fractional a, Ord a) => a -> Char

avgGrade x
  | y >= 0.9  = 'A'
  | y >= 0.8  = 'B'
  | y >= 0.7  = 'C'
  | y >= 0.59 = 'D'
  | otherwise = 'F'
  where y = x / 100

> avgGrade 90
A

> avgGrade 75
C

> avgGrade 60
D
```

2. If `avgGrade` guards are reorder, it will only return `F` for values less than 0.59 or `D` for values greater or equals than 0.59.
3. `pal` will return b) `True` when `xs` is a palindrome.
4. `[a]`
5. `pal :: Eq a => [a] -> Bool`
6. `numbers` will return c) an indication of whether its argument is positive or negative number or zero.
7. `Num`
8. `numbers :: (Ord a, Num a, Num p) => a -> p`

## Chapter Exercises

### Multiple choice

1. A polymorphic function _may resolve to values of different types, depending on inputs_
2. `f :: Char -> String` and `g :: String -> [String]`. `g . f` has the type `Char -> [String]`
3. `f :: Ord a => a -> a -> Bool` and we apply it to one numeric value, the type will be `(Ord a, Num a) => a -> Bool`
4.`(a -> b) -> c` _is a higher-order function_
5. Given `f x = x`, the type of `f True` is `f True :: Bool`

### Let's write some code

1. Given

``` haskell
tensDigit :: Integral a => a -> a
tensDigit x = d
    where xLast = x `div` 10
          d     = xLast `mod` 10

-- Rewrite using divMod
tensDigit2 :: Integral a => a -> a
tensDigit2 x = d
    where (xLast, _) = x `divMod` 10
          (_, d)     = xLast `divMod` 10

hunsD x :: Integral a => a -> a
hunsD = (`mod` 10) . (`div` 100)
```

2. Implement `foldBool :: a -> a -> Bool -> a`

``` haskell
foldBool :: a -> a -> Bool -> a

-- Using case
foldBool trueValue falseValue b =
  case b of
    True -> trueValue
    True -> falseValue

-- Using guards
foldBool trueValue falseValue b
  | b == True  = trueValue
  | b == False = falseValue
```

3. Fill in the definition:

``` haskell
g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c)
```

4. [arith4.hs](/arith4.hs)
