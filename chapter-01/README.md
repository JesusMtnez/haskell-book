# Chapter 1: Anything from almost nothing

### Intermission: Equivalence Exercises

1. `λxy.xs` is equivalent to `b) λmn.mz`
2. `λxy.xxy` is equivalent to `c) λa.(λb.aab)`
3. `λxyz.zx` is equivalent to `b) λtos.st`

_beta normal form_: when you can not beta reduce more.
_combintar_: lambda term with no free variables, that allows to combine the arguments it is given without injecting new values.

## Exercises

### Combinators

1. `λx.xxx`: **it is** a combinator.
2. `λxy.zx`: **it is not** a combinator because `z` is a free variable.
3. `λxyz.xy(zx)`: **it is** a combinator.
4. `λxyz.xy(zxy)`: **it is** a combinator.
5. `λxy.xy(zxy)`: **it is not** a combinator.

### Normal form or diverge ?

1. `λx.xxx`: **normal form**
2. `(λz.zz)(λy.yy)`: **diverge**

```
(λz.zz)(λy.yy)
[z := (λy.yy)]
(λy.yy)(λy.yy) -- I could rename the first to z, which is not the same z as the first one
(λz.zz)(λy.yy) -- This is equivalent to the original expression, so it never converges
```

3. `(λx.xxx)z`: it can be reduced to `λz.zzz`, which would be its normal form.
