defmodule MyString do
  def is_ascii?([]), do: true
  def is_ascii?([head | tail]) when head in ?\s..?~ do
    is_ascii?(tail)
  end
  def is_ascii?(_), do: false

  def anagram?(word1, word2) do
    Enum.sort(word1) == Enum.sort(word2)
  end

  def calculate(expression) do
    parse(expression, [])
  end

  defp _calculate(?+, op1, op2), do: op1 + op2
  defp _calculate(?-, op1, op2), do: op1 - op2
  defp _calculate(?*, op1, op2), do: op1 * op2
  defp _calculate(?/, op1, op2), do: div(op1, op2)

  defp parse([], _), do: raise "No operator found!"
  defp parse([head | op2], op1) when head in '+-*/' do
    _calculate(head, clean_operand(op1), clean_operand(op2))
  end
  defp parse([head | tail], op1) do
    parse(tail, List.insert_at(op1, -1, head))
  end

  defp clean_operand(op) do
    space? = fn x -> x in ' ' end
    {int, _} = Enum.reject(op, space?) |> :string.to_integer
    int
  end
end
