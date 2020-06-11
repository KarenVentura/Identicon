defmodule Identicon do
  def main(input) do
    input # pass the parm to the function as the first argument
    |> hash_input
  end

  def hash_input(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list 
  end
end 
