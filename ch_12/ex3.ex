defmodule Blah do
  def ok!(p) do
    case p do
      {:ok, data} -> data
      _ -> raise "Data was not ok"
    end
  end
end
