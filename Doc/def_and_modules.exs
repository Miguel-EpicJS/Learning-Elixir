defmodule ThisIsAModule do
  def andThisIsAFunction do
    "You dont need to use `return` for return a value in elixir"
  end
end

#call the function with: ModuleName.FunctionName

IO.puts ThisIsAModule.andThisIsAFunction()

#or you can use `alias`

alias ThisIsAModule
