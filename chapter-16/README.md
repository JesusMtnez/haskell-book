# Chapter 16: Functors!

## Exercises: Be kind

1. `f :: a -> a` has kind `*`.
2. `f :: a -> b a -> T (b a)`, `b` and `T` have kind `* -> *`.
3. `f :: c a b -> c b a`, `c` has kind `* -> * -> *`.

## Exercises: Heavy lifting

1. `a = fmap (+1) $ read "[1]" :: [Int]`
2. `b = (fmap . fmap) (++ "lol") (Just ["Hi,", "Hello"])`
3. `c = fmap (*2) (\x -> x - 2)`
4. `d = ((return '1' ++) . show) . (\x -> [x, 1..3])`
5. Answer
``` haskell
e :: IO Integer
e = let ioi = readIO "1" :: IO Integer
        changed = fmap (read . ("123"++) . show) ioi
    in fmap (*3) changed
```

## Exercises: [FuncInstances.hs](funcInstance.hs)

## Exercise: [Possibly](Possibly.hs)

## Chapter Exercises

Determine whether a valid `Functor` can be written for the datatype provided:

1. `data Bool = False | True` <- No, kind is `*`
2. Yes, kind is `* -> *`
``` haskell
data BoolAndSomethingElse a =
    False' a
  | True' a

instance Functor BoolAndSomethingElse where
  fmap f (False' a) = False' (f a)
  fmap f (True' a) = True' (f a)
```
3. Yes, kind is `* -> *`
``` haskell
data BoolAndMaybeSomethingElse a =
    Falsish
  | Truish a

instance Functor BoolAndMaybeSomethingElse where
  fmap _ Falsish = Falsish
  fmap f (Truish a) = Truish (f a)
```
4. `newtype Mu f = InF { outF :: f (Mu f) }` <- No, kind is `(* -> *) -> *`
5. `data D = D (Array Word Word) Int Int` <- No, kind is `*`

Rearrange the arguments to the type constructor of the datatype so the Functor instance works:

1. Answer

``` haskell
data Sum b a =
    First a
  | Second b

instance Functor (Sum e) where
  fmap f (First a) = First (f a)
  fmap f (Second b) = Second b
```

2. Answer

``` haskel
data Company a c b =
    DeepBlue a c
  | Something b

instance Functor (Company e e') where
  fmap f (Something b) = Something (f b)
  fmap _ (DeepBlue a c) = DeepBlue a c
```

3. Answer

``` haskell
data More b a =
    L a b a
  | R b a b
  deriving (Eq, Show)

instance Functor (More x) where
  fmap f (L a b a') = L (f a) b (f a')
  fmap f (R b a b') = R b (f a) b'
```

Write `Functor` instances: [FuncInstancesExer](FuncInstancesExer.hs)
