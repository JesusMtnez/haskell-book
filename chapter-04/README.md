# Chapter 4: Basic datatypes

## Exercises: Mood Swing

Given:

``` haskell
data Mood = Blah | Woot deriving Show
```

1. The type constructor is `Mood`.
2. The values you could possibly use are `Blah` and `Woot`.
3. That type signature indicates that given any `Mood`, it would always return `Woot`. The correct signature would be `changeMood :: Mood -> Mood`.
4. The solutions would be:

``` haskell
changeMood Blah = Woot
changeMood Woot = Blah
```

5. [mood.hs](mood.hs)

## Exercises: Find the Mistakes

1. `not True && true` => `not True && True`
2. `not (x = 6)` => `not (x == 6)`
3. `(1 * 2) > 5` **is** correct
4. `[Merry] > [Happy]` => `"Meery" > "Happy"`
5. `[1, 2, 3] ++ "look at me!"` => `"1,2,3" ++ "look at me!"`

## Chapter Exercises

``` haskell
awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]
```

1. `length :: Foldable t => T a -> Int`. It has one argument, and it returns an `Int`.
2. Results: a.5 b.3 c.2 d.5
3. It fails because `length` returns an `Int`, not a `Fractional`.
4. `div 6 length [1,2,3]`
5. The result type is `Bool` and the result is `True`.
6. The result type is `Bool` and the result is `False`.
7. Answers:
   - `length allAwesome == 2` **will work** and the result would be `True`.
   - `lenght [1, 'a', 3, 'b']` **will not work** because the elements in a `List` must have the same type.
   - `length allAwesome + lenght awesome` **will work** and the result would be `5`.
   - `(8 == 8) && ('b' < 'a')` **will work** and the result would be `False`.
   - `(8 == 8) && 9` **will not work** because `9` is not a `Bool`.
8. Answer:
``` haskell
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome s = (reverse s) == s
```
9. Answer:
``` haskell
myAbs :: Integer -> Integer
myAbs i = if i < 0 then i * (-1) else i
```
10. Answer:
``` haskell
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f t1 t2 = ((snd t1, snd t2), (fst t1, fst t2))
```

### Correct syntax

1. Answer:
``` haskell
x = (+)

f :: String -> Integer
f xs = x w 1
    where w = length xs
```
2. Answer:
``` haskell
\x -> x
```
3. Answer:
``` haskell
f :: (a, b) -> a
f t = fst t
```

### Match the function names to their types

1. `Show a => a -> String`
2. `Eq a => a -> a -> Bool`
3. `fst :: (a, b) -> a`
4. `(+) :: Num a => a -> a -> a`


[mood.hs](/mood.hs)
