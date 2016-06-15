# Chapter 6, Exercise 4
# Recursive sum using pattern matching
defmodule Recursive do
  def sum(0), do: 0
  def sum(n), do: n + sum(n-1)
end
