defmodule MyEnum do
  def all?([], _fun), do: true
  def all?([head | tail ], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _fun), do: []
  def each([head | tail], func) do
    [ func.(head) | each(tail, func) ]
  end


  def filter([], _), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split([head | tail], target) when target > 0 do
    [left, right] = split(tail, target - 1)
    [[head | left], right]
  end
  def split(list, _target), do: [[], list]

  def take([head | tail], count) when count > 0 do
    [head | take(tail, count - 1)]
  end
  def take(_list, _count), do: []
end
