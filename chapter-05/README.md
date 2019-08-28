# Chapter 5: Types

## Exercises: Type Matching

1. `not :: Bool -> Bool`
2. `length :: [a] -> Int`
3. `concat :: [[a]] -> [a]`
4. `head :: [a] -> a`
5. `(<) :: Ord a => a -> a -> Bool`

## Exercises: Type Arguments

1. `f :: a -> a -> a -> a` and `x :: Char`, then `f x` type is `Char -> Char -> Char`
2. `g :: a -> b -> c -> b` then `g 0 'c' "woo"` type is `Char`
3. `h :: (Num a, Num b) => a -> b -> b` then `h 1.0 2` type is `Num b => b`
4. `h :: (Num a, Num b) => a -> b -> b` then `h 1 (5.5 :: Double)` type is `Double`
5. `jackal :: (Ord a, Eq b) => a -> b -> a` then `jackal "keyboard" "has the word jackal in it"` type is `[Char]`
6. `jackal :: (Ord a, Eq b) => a -> b -> a` then `jackal "keyboard"` type is `Eq b => b -> [Char]`
7. `kessel :: (Ord a, Num b) => a -> b -> a` then `kessel 1 2` type is `(Ord a, Num a) => a`
8. `kessel :: (Ord a, Num b) => a -> b -> a` then `kessel 1 (2 :: Integer)` type is `(Num a, Ord a) => a`
9. `kessel :: (Ord a, Num b) => a -> b -> a` then `kessel (1 :: Integer) 2` type is `Integer`

## Exercises: Parametricity

1. `id :: a -> a`
2. Answer:
``` haskell
f :: a -> a -> a
f a b = a -- implementation 1
f a b = b -- implementation 2
```
3. It can only have 1 implementation. First argument of type `a` is completely ignored, it does not matter
   which type it is. It leave us with `b -> b` which is _id_ function.

## Exercises: Apply Yourself

1. The type will be `myConcat :: [Char] -> [Char]`
2. The type will be `myMult :: Fractional a => a -> a`
3. The type will be `myTake :: Int -> [Char]`
4. The type will be `myCom :: Int -> Bool`
5. The type will be `myAlph :: Char -> Bool`

## Chapter Exercises

### Multiple choice

1. A value of type `[a]` is _a list of whose elements are all of some type `a`_
2. A function of type `[[a]] -> [a]` could _take a list of strings as an argument_
3. A fucntion of type `[a] -> Int -> a` _returns one element of type `a` from a list_
4. A function of type `(a, b) -> a` _takes a tuple argument and returns the first value_

### Determine the type ([`determineTheType.hs`](determineTheType.hs))

### Does it compile?

1. `wahoo` does not compile because bigNum is a value, not a function. I would fix it this way:
``` haskell
bigNum = (^) 5
wahoo = bigNum $ 10
```
2. It compiles.
``` haskell
x = print
y = print "woohoo!"
z - x "hello world"
```
3. `c = b 10` does not compile because `b` is a value. I would fix it this way:
``` haskell
a = (+)
b = 5
c = a 10
d = c 200
```
4. `b = 1000 * c` does not compile because `c` does not exist. I would fix it:
``` haskell
a = 12 + b
b = 10000
```

### Type variable or specific type constructor?

2. [0] is a fully polymorphic type, [1] and [2] are concrete type constructors.
``` haskell
f :: zed => Zed -> Blah
     [0]    [1]     [2]
```
2. [0] is a fully polymorphic type, [1] is a constrained type by `Enum` and [2] is a concrete type constructor.
``` haskell
f :: Enum b => a -> b -> C
              [0]  [1]  [2]
```
3. [0] and [1] are fully polymorphic types, and [2] is a concrete type constructor.
``` haskell
f :: f -> g -> C
    [0]  [1]  [2]
```

### Write a type signature

1. `functionH :: [a] -> a`
2. `functionC :: Ord a => a -> a -> Bool`
3. `functionS :: (a, b) -> b`

### Given a type, write the function

1. Answer
``` haskell
i :: a -> a
i = \x -> x
```
2. Answer
``` haskell
c :: a -> b -> a
c x _ = x
```
3. `c''` is equivalent to `c`.
4. Answer
``` haskell
c' :: a -> b -> b
c' _ x = x
```
5. Answer
``` haskell
r :: [a] -> [a]
r = undefined
```
6. Answer
``` haskell
co :: (b -> c) -> (a -> b) -> a -> c
co b2c a2b a = b2c $ a2b a
```
7. Answer
``` haskell
a :: (a -> c) -> a -> a
a _ x = x
```
8. Answer
``` haskell
a' :: (a -> b) -> a -> b
a' a2b a = a2b a
```

### Fix it

1. [`sing.hs`](/sing.hs)
3. [`arith.hs`](/arith.hs)

### Type-Known-Do

1. Answer
``` haskell
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h i = g $ f i
```
2. Answer
``` haskell
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e x = w $ q x
```
3. Answer
``` haskell
data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (a, b) = (xz a, yz b)
```
4. Answer

``` haskell
munge :: (x -> y)
      -> (y -> (w, z))
      -> x
      -> w
munge f g x = fst $ g $ f x
```

[determineTheType.hs](/determineTheType.hs)
