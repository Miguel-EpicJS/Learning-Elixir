defmodule ThisIsAModule do
  def andThisIsAFunction do
    "You dont need to use `return` for return a value in elixir"
  end
end

#call the function with: ModuleName.FunctionName

IO.puts ThisIsAModule.andThisIsAFunction()

defmodule ThisIsAModule.Inside do
  def thisIsAnotherFunction do
    "Yep, you can use multiple modules"
  end
end

# for this use alias

alias ThisIsAModule.Inside

IO.puts Inside.thisIsAnotherFunction()
