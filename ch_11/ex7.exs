defmodule CSV do
  def read(filename) do
    file = File.open!(filename)
    headers = read_headers(IO.read(file, :line))
    Enum.map(IO.stream(file, :line), &create_row(headers, &1))
  end

  defp read_headers(line) do
    from_csv_and_map(line, &String.to_atom(&1))
  end

  defp from_csv_and_map(row, map_func) do
    row
    |> String.strip
    |> String.split(~r/,\s*/)
    |> Enum.map(map_func)
  end

  defp create_row(headers, row_csv) do
    row = from_csv_and_map(row_csv, &maybe_convert_nums(&1))
    Enum.zip(headers, row)
  end

  defp maybe_convert_nums(value) do
    cond do
      Regex.match?(~r/^\d+$/, value) -> String.to_integer(value)
      Regex.match?(~r/^\d+\.\d+$/, value) -> String.to_float(value)
      << ?: :: utf8, name :: binary >> = value -> String.to_atom(String.upcase(name))
      true -> value
    end
  end
end

defmodule Taxes do
  def do_taxes(orders, rates) do
    for order = [_, ship_to: state, net_amount: net] <- orders do
      tax = net * Keyword.get(rates, state, 0)
      Keyword.put(order, :total_amount, tax + net)
    end
  end
end

tax_rates = [NC: 0.075, TX: 0.08]

orders = CSV.read("test_data.txt")
IO.inspect Taxes.do_taxes(orders, tax_rates)
