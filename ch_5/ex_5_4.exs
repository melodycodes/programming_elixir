# Chapter 5, Exercise 4
# Practicing parameterized functions & closures
prefix = fn
  outer -> fn
    inner -> "#{outer} #{inner}"
  end
end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")

IO.puts prefix.("Elixir").("Rocks")
