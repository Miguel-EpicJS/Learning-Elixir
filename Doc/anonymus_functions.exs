mult = fn a,b -> a * b end
add = fn a,b -> a + b end
sub = fn a,b -> a - b end
div = fn a,b -> a / b end

IO.puts(mult.(1, 2))
IO.puts(add.(1, 2))
IO.puts(sub.(1, 2))
IO.puts(div.(1, 2))
