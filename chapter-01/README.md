# Chapter 1: All You Need is Lambda

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
(λy.yy)(λy.yy) -- This is alpha equivalent to the original expression, so it never converges
```

3. `(λx.xxx)z`: it can be reduced to `zzz`, which would be its normal form.

## Beta reduce

1. `(λabc.cba)zz(λwv.w)`

```
(λabc.cba)zz(λwv.w)
(λa.λb.λc.cba)(z)z(λw.λv.w)
[a := z]
(λb.λc.cbz)z(λw.λv.w)
[b := z]
(λc.czz)(λw.λv.w)
[c := λw.λv.w]
(λw.λv.w)(z)z
[w := z]
(λv.z)(z)
[v := z]
z
```

2. `(λx.λy.xyy)(λa.a)b`

```
(λx.λy.xyy)(λa.a)b
[x := λa.a]
(λy.(λa.a)(y)y)b
[a := y]
(λy.yy)b
[y := b]
bb
```

3. `(λy.y)(λx.xx)(λz.zq)`

```
(λy.y)(λx.xx)(λz.zq)
[y := λx.xx]
(λx.xx)(λz.zq)
[x := λz.zq]
(λz.zq)(λz.zq)
[z := λz.zq]
(λz.zq)q
[z := q]
qq
```

4. `(λz.z)(λz.zz)(λz.zy)`

```
(λz.z)(λz.zz)(λz.zy)
(λz.z)(λx.xx)(λt.ty)
[z := λx.xx]
(λx.xx)(λt.ty)
[x := λt.ty]
(λt.ty)(λt.ty)
[t := λt.ty]
(λt.ty)y
[t := y]
yy
```

5. `(λx.λy.xyy)(λy.y)p`

```
(λx.λy.xyy)(λy.y)p
(λx.λy.xyy)(λt.t)p
[x := λt.t]
(λy.(λt.t)(y)y)p
[y := p]
(λt.t)(p)p
[t := p]
pp
```

6. `(λa.aa)(λ.b.ba)c`

```
(λa.aa)(λb.ba)c
(λx.xx)(λb.ba)c
[x := λb.ba]
(λb.ba)(λb.ba)c
[b := λb.ba]
(λb.ba)(a)(c)
[b := a]
aac
```

7. `(λxyz.xz(yz))(λx.z)(λx.a)`

```
(λxyz.xz(yz))(λx.z)(λx.a)
(λx.λy.λz.xz(yz))(λb.c)(λd.a)
[x := λb.c]
(λy.λz.(λb.c)z(yz))(λd.a)
[y := λd.a]
λz.(λb.c)z((λd.a)z)
[d := z]
λz.(λb.c)(z)a
[b := z]
λz.ca
```
