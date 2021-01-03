defmodule Pipe do
  def showName(name) do
    "Your name is: #{name}"
  end
  def showPhrase(phr) do
    "You said: \"#{phr}\""
  end
  def jumpLine(phrase) do
    "\n#{phrase}\n"
  end
end

IO.puts Pipe.jumpLine(Pipe.showPhrase(Pipe.showName("Miguel"))) # or i can use this:
IO.puts Pipe.showName("Miguel") |> Pipe.showPhrase() |> Pipe.jumpLine()
