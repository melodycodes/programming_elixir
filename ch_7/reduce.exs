defmodule MyList do
  def reduce([], value, _) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def mapsum([], _), do: 0
  def mapsum([head | tail], func) do
    func.(head) + mapsum(tail, func)
  end

  def max([m]), do: m
  def max([m | [head| tail] ]) when m >= head do
    max([m | tail])
  end
  def max([m | [head | tail]]) when m < head do
    max([head | tail])
  end

  def caesar([], _n), do: []
  def caesar([head | tail], n) when head + n <= ?z do
    [ head + n | caesar(tail, n)]
  end
  def caesar([head | tail], n) do
    [ head + n - 26 | caesar(tail, n) ]
  end
 end
