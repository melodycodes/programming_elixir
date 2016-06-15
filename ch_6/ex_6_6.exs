# Chapter 6, Exercise 6
# Binary guess basically
defmodule Chop do
  def mid(a,b) do
    div(a+b, 2)
  end

  def guess(actual, range = low..high) do
    current = mid(low, high)
    IO.puts "Is it #{current}"
    guess_help(actual, range, current)
  end

  def guess_help(actual, _, actual) do
    IO.puts "#{actual}"
  end

  def guess_help(actual, _low..high, current) when actual > current do
    guess(actual, current+1..high)
  end

  def guess_help(actual, low.._high, current) when actual < current do
    guess(actual, low..current-1)
  end
end
