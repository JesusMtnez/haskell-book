# Chapter 2: Hello, Haskell!

## Interacting with Haskell code
- `stack ghci`: starts a REPL
  - `:quit` or `:q` exits the REPL
  - `:info <thing-you-wnat-info-about>` or `:i` gives you info about something
  - `:load <file>` or `:l` will load a file content
  - `:reload` or `:r` will reload the file

### Hello world example ([`test.hs`](test.hs))

``` sh
$ stack ghci

Prelude> :load chapter-02/test.hs
[1 of 1] Compiling Main             ( chapter-02/test.hs, interpreted )
Ok, one module loaded.

*Main> sayHello "world"
Hello, world!
```

## Exercises: Comprehension Check

1. Adding `let` before the expressions.
2. Function `circleArea`:
``` haskell
circleArea radius = 3.14 * radius^2
```
3. Function `circleArea`:
``` haskell
circleArea radius = pi * radius^2
```

## Exercises: Parentheses and Association

1. It **changes** the result because `*` has precendence over `+`, but the parentheses change that.
2. It **does not change** the result because `*` has precendence over `+`.
3. It **changes** the result because the `/` has precendence over `+`, but the parentheses change that.

## Exercises: Heal the Sick

1. `let area x = 3.14 * (x * x)`
2. `let double x = x * 2`
3. `y` is not properly aligned
```haskell
x = 7
y = 10
f = x + y
```

## Exercises: A Head Code ([`rewrites.hs`](rewrites.hs))

## Exercises

### Parenthesization

1. `2 + 2 * 3 - 1` -> `2 + (2 * 3) - 1`
2. `(^) 10 $ 1 + 1` -> `(^) 10 $ (1 + 1)`
3. `2 ^ 2 * 4 ^ 5 + 1` -> `((2 ^ 2) * (4 ^ 5)) + 1`

### Equivalence

1. `1 + 1` **is** equivalent to `2`
2. `10 ^ 2` **is** equivelent to `10 + 9 * 10` since both can be reduced to `100`.
3. `400 - 37` **is not** equivalent to `(-) 37 400` because:
```
(-) 37 400 == 37 - 400 != 400 - 37
```
4. `100 div 3` **is not** equivalent to `100 / 3` because `/` is franctional divisition, and `div` is integer division (no decimals).
5. `2 * 5 + 18` **is not** equivalent to `2 * (5 + 18)` because the parenthesis changed the precendence of `+`.

### More fun with functions ([`moreFunWithFunctions.hs`](moreFunWithFunctions.hs))

1. Results:
  - `10 + waxOn = 1135`
  - `(+10) waxOn = 1135`
  - `(-) 15 waxOn = -1110`
  - `(-) waxOn 15 = 1110`
3. The result will be 3 times `waxOn` value: `3375`
4. Function `waxOn` using `where` clause:
``` haskell
waxOn = x * 5
  where z = 7
        y = z + 8
        x = y ^ 2
```


[test.hs](/test.hs)
[learn.hs](/learn.hs)
[rewrites.hs](/rewrites.hs)
[moreFunWithFunctions.hs](/moreFunWithFunctions.hs)
