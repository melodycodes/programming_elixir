# Chapter 6, Exercises 1-3
# Modules & Named Functions
defmodule Times do
  def double(n), do: n * 2

  def triple(n), do: n * 3

  def quadruple(n), do: double(double(n))
end
