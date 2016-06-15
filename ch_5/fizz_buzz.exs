# Chapter 5, Exercise 2
# FizzBuzz... a classic
fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> "#{a}"
end

IO.puts "Should be FizzBuzz: #{fizz_buzz.(0,0,1)}"
IO.puts "Should be Fizz: #{fizz_buzz.(0,2,3)}"
IO.puts "Should be Buzz: #{fizz_buzz.(2,0,3)}"
IO.puts "Should be 3: #{fizz_buzz.(1,2,3)}"
