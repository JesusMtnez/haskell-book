module FuncInstances where

-- 1
newtype Identity a = Identity a deriving Show
instance Functor Identity where
  fmap f (Identity a) = Identity (f a)

-- 2
data Pair a = Pair a a deriving Show
instance Functor Pair where
  fmap f (Pair a b) = Pair (f a) (f b)

-- 3
data Two a b = Two a b deriving Show
instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)

-- 4
data Three a b c = Three a b c deriving Show
instance Functor (Three a b) where
  fmap f (Three a b c) = Three a b (f c)

-- 5
data Three' a b = Three' a b b deriving Show
instance Functor (Three' a) where
  fmap f (Three' a b1 b2) = Three' a (f b1) (f b2)

-- 6
data Four a b c d = Four a b c d deriving Show
instance Functor (Four a b c d) where
  fmap f (Four a b c d) = Four a b c (f d)

-- 7
data Four' a b = Four' a a a b deriving Show
instance Functor (Four' a a a) where
  fmap f (Four' a1 a2 a3 b) = Four' a1 a2 a3 (f b)

-- 8
-- data Trivial = Trivial
-- Not possible, it is not a container, no way of doing fmap over it.
