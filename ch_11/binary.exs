defmodule MyString do
  def center(list) do
    size = Enum.map(list, &(String.length(&1))) |> Enum.max
    list
    |> Enum.map(&(pad(&1, size)))
    |> Enum.each(&IO.puts/1)
  end

  defp pad(word, max_size) do
    word_size = String.length(word)
    diff = max_size - word_size
    String.rjust(word, word_size + div(diff, 2))
  end
end
