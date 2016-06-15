# Chapter 5, Exercise 3
# More FizzBuzz
fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> "#{a}"
end

call_fizz = fn
  n -> IO.puts fizz_buzz.(rem(n, 3), rem(n, 5), n)
end

call_fizz.(10)
call_fizz.(11)
call_fizz.(12)
call_fizz.(13)
call_fizz.(14)
call_fizz.(15)
call_fizz.(16)
