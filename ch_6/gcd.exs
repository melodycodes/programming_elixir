# Chapter 6, Exercise 5
# Greatest common divisor using pattern matching
defmodule Algebra do
  def gcd(x,0), do: x
  def gcd(x,y), do: gcd(y,rem(x,y))
end
