defmodule MyString do
  def capitalize_sentences(str) do
    String.split(str, ". ")
    |> Enum.map_join(". ", &String.capitalize(&1))
  end
end
