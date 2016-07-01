defmodule MyList do
  def span(to, to), do: [to]
  def span(from, to), do: [from | span(from + 1, to)]

  def primes_up_to(n) do
    for x <- span(2, n), prime?(x), do: x
  end

  def prime?(2), do: true
  def prime?(x) do
    Enum.all?(span(2, x-1), &(rem(x, &1) !== 0))
  end
end
