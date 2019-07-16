# Chapter 3: Strings

In GHCi, we can use `:type` to describe the type signature of an expression or function or value.

## Printing simple strings ([`print1.hs`](print1.hs))([`print2.hs`](print2.hs))

Functions to print strings:
- `print`
- `putStrLn` and `putStr`

We can use `do` sintax to sequence the actions that constitutes our program

### String concatenation ([`print3.hs`](print3.hs))

We use `concat` (`++`) to concatenate strings.

## Top-level vs local definitions

### Exercises: Scope

1. All variable are declare in the top-level, so **there is** a `y` in scope for `z`.
2. `h` **is not** defined in the scope for `g`.
3. It **is not**, it is missing `d`.
4. `r` **is** a local binding in `area` function, but `d` **is not** declared anywhere.

## Types of concatenation functions

- `++`: `[a] -> [a] -> [a]`
- `concat`: `Foldable t => t [a] -> [a]`

### Exercises: Syntax Errors

1. `++ [1, 2, 3] [4, 5, 6]` => `(++) [1, 2, 3] [4, 5, 6]`
2. `'<3' ++ ' Haskell` => `"<3" ++ " Haskell"`
3. `concat ["<3", " Haskell"]` has no errors

## More list functions

- `:`: *cons* operator to build list: `'c' : "hris"` -> `"chris"`
- `head`: returns the head or first element or a list
- `tail`: returns the list without the head
- `take`: returns the specified number of elements from the list starting from the left
- `drop`: returns the remainder of the list after dropping the specified number of elements
- `++`: infix concatenate
- `!!`: infix operator, returns the element at the specified position

Most of these functions are considered *unsafe* because do not cover error cases, throwing *exceptions*.

## Exercises: Reading syntax

1. Test and correct as many as you can:
   a. `concat [[1, 2, 3], [4, 5, 6]]` **is correct**
   b. `++ [1, 2, 3] [4, 5, 6]` **is correct**
   c. `(++) "hello" " world"` **is correct**
   d. `["hello" + "world]` **is not correct**. It should be: `["hello" ++ "world"]`
   e. `4 !! "hello"` **is not correct**. It should be: `"hello" !! 4`
   f. `(!!) "hello" 4` **is correct**
   g. `take "4 lovely"` **is not correct**. It should be: `take 4 "lovely"`
   h. `take 3 "awesome"` **is correct**

2. Match the code with its result
  a. `concat [[1 * 6], [2 * 6], [3 * 6]]` with d) `[6, 12, 18]`
  b. `rain ++ drop 2 "elbow"` with c) `"rainbow"`
  c. `10 * head [1, 2, 3]` with e) `10`
  d. `(take 3 "Julie") ++ (tail "yes")` with a) `"Jules"`
  e. `concat [tail [1,2,3], tail [4,5,6], tail [7,8,9]]` with b) `[2,3,5,6,8,9]`

## Exercises: Building functions

1. Write the following expressions:

``` haskell
-- input: "Curry is awesome"
-- output: "Curry is awesome"

"Curry is awesome" ++ "!"
```

``` haskell
-- input: "Curry is awesome!"
-- output: "y"

"Curry is awesome!" !! 4
```

``` haskell
-- input: "Curry is awesome!"
-- output: "awesome!"

drop 9 "Curry is awesome!"
```

2. [exercise2.hs](exercise2.hs)

3. Write a function:

``` haskell
thirdLetter :: String -> Char
thirdLetter s = s !! 2
```

4. Write function:

``` haskell
letterIndex :: Int -> Char
letterIndex i = "Curry is awesome!" !! i
```

5. `rvrs` function:

``` haskell
rvrs :: String -> String
rvrs s = (drop 9 s) ++ "" (take 4 $ drop 5 s) ++ (take 5 s)
```

6. [Reverse.hs](reverse.hs)

[print1.hs](/print1.hs)
[print2.hs](/print2.hs)
[print3.hs](/print3.hs)
[exercise2.hs](/exercise2.hs)
[reverse.hs](/Reverse.hs)
