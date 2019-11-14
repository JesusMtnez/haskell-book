# Chapter 5: Type classes

## Exercises: Eq instances

1. Answer:
``` haskell
data TisAInteger = TisA Integer

instance Eq TisAInteger where
  (==) (TisA n)
       (TisA n') = n == n'
```
2. Answer:
``` haskell
data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two a b)
       (Two a' b') = a == a' && b == b'
```
3. Answer:
``` haskell
data StringOrInt =
    TisAnInt Int
  | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt i)
       (TisAnInt i') = i == i'
  (==) (TisAString s)
       (TisAString s') = s == s'
  (==) _ _ = False
```
4. Answer:
``` haskell
data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
  (==) (Pair a b)
       (Pair a' b') = a == a' && b == b'
```
5. Answer:
``` haskell
data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a b)
       (Tuple a' b') = a == a' && b == b'
```
6. Answer:
``` haskell
data Which a =
    This a
  | That a

instance Eq a => Eq (Which a) where
  (==) (This x) (This x') = x == x'
  (==) (That y) (That y') = y == y'
  (==) _ _                = False
```
7. Answer:
``` haskell
data EitherOr a b =
    Hello a
  | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (Hello x) == (Hello x') = x == x'
  (Goodbye y) == (Goodbye y') = y == y'
  _ == _ = False
```

## Exercises: Will They Work?

1. **It will work** because it will resolve to `max 3 5` which is `5`.
``` haskell
max (length [1, 2, 3])
    (length [8, 9, 10, 11, 12])
```
2. `compare (3 * 4) (3 * 5)` **will work** and the result is `LT`.
3. `compare "Julie" True` **will not work** because it is trying to compare two different types.
4. `(5 + 3) > (3 + 6)` **will work** and the result is `False`.

## Chapter Exercises

### Multiple choice

1. The Eq class _makes equality tests possible_.
2. The type class Ord _is a subclass of Eq_.
3. Operator `>` has type `Ord a => a -> a -> Bool`.
4. In `x = divMod 12 16` the type of `x` is a tuple.
5. The type class Integral includes _Int and Integer numbers_.

### Does it typecheck?

1. It will not typecheck because `Person` does not have an instance of the type class `Show`
``` haskell
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)
```

2. It will not typecheck because `Mood` does not have an instance for the type class `Eq`
``` haskell
data Mood = Blah | Woot deriving (Show, Eq)

settleDown x = if x == Woot
                 then Blah
                 else x
```

3. Answers:
    - Any instance of type `Mood` is valid.
    - It will not be valid because `9` is not of type `Mood`.
    - It will not be possible because `Mood` does not have an instance for `Ord`.

4. It will typecheck.
``` haskell
type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object deriving (Eq, Show)

s1 = Sentence "dogs" "drool" -- Note: This is partially applying Sentence constructor

s2 = Sentence "Julie" "loves" "dogs"
```

### Given a data type declaration, what can we do?

``` haskell
data Rocks = Rocks String deriving (Eq, Show)

data Yeah = Yeah Bool deriving (Eq, Show)

data Papu = Papu Rocks Yeah deriving (Eq, Show)
```

1. `phew = Papu "chases" True` will not typecheck, it should be `phew = Papu (Rocks "chases") (Yeah True)`.
2. `truth = Papu (Rocks "chomskydoz") (Yeah True)` will typecheck.
3. It will typecheck because `Papu` implements `Eq` type class.
``` haskell
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'
```
4. It will not typecheck because `Papu` does not implement `Eq` type class.
``` haskell
comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'
```

### Match the types

1. Given:

``` haskell
i :: Num a => a
i = 1

-- Try
i' :: a
i' = 1
```

If we try to replace it with `i :: a`, `i = 1` will fail because `1` will not fit in a typeless value.

2. Given:

``` haskell
f :: Float
f = 1.0

f' :: Num a => a
f' = 1.0
```

It is not possible because `1.0` implies a type like `Double` or `Float`, which are under `Fractional` type class.

3. Given:

``` haskell
f :: Float
f = 1.0

f' :: Fractional a => a
f' = 1.0
```

It is possible because `1.0` implies a type like `Float` or `Double`, which are implementations for `Fractional` type class.

4. Given:

``` haskell
f :: Float
f = 1.0

f' :: RealFrac a => a
f' = 1.0
```

It is possible because `1.0` is a `Fractional`.

5. Given:

``` haskell
freud :: a -> a
freud x = x

freud' :: Ord a => a -> a
freud' x = x
```

It is possible because `freud` is the `Id` function. Adding the type class `Ord` to the type will just allow types that implement `Ord` type class, but it this case it is not using it.

6. Given:

``` haskell
freud :: a -> a
freud x = x

freud' :: Int -> Int
freud' x = x
```

It is possible again because `freud` is the `Id` function and it is not using any operation related to type `Int`.

7. Given:

``` haskell
myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX

sigmund' :: a -> a
sigmund' x = myX
```

It is possible since `sigmund'` will always return an `Int` because it is using `myX`, so `a` type will always be `Int`.

8. Given:

``` haskell
myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX

sigmund' :: Num a => a -> a
sigmund' x = myX
```

It is possible since `Int` is a type that implements `Num` instance, and using `myX` makes type `a` an `Int`.

9. Given:

``` haskell
jung :: Ord a => [a] -> a
jung xs = head (sort xs)

jung' :: [Int] -> Int
jung' xs = head $ sort xs
```

It will be possible because `Int` implements `Ord` which is the only requirement since the only required funcions are `head` (from `Data.List`) and `sort` from `Ord` type class.

10. Given:

``` haskell
young :: [Char] -> Char
young xs = head (sort xs)

young' :: Ord a => [a] -> a
young' xs = head $ sort xs
```

As before, `Char` implements `Ord` type class, and no other functions are required.

11. Given:

``` haskell
mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (mySort xs)

signifier' :: Ord a => [a] -> a
signifier' xs = head (mySort xs)
```

This one would not be possible because `mySort` is only a function for `[Char]`, for any type implementing `Ord` type class.

### Type-Known-Do Two: Electric Typealoo

1. Answer:

``` haskell
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f a b = (f a) == b
```

2. Answer

``` haskell
arith :: Num b => (a -> b) -> Integer -> a -> b
arith f i a = f a + fromInteger i
```
