defmodule Identicon do
  def main(input) do
    input # pass the parm to the function as the first argument
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> Enum.map(&mirror_row/1) # in this case we are passing a reference comming from Enum.chunk
    # and it says & we are passing a collection of references and then passing the function
    # /1 is saying that the | should take the value from the function
  end

  def mirror_row(row) do
    # [145, 42, 200]
    [first_element, second_element | _tail] = row

    # [145, 42, 200, 42, 145]
    row ++ [second_element , first_element]
  end

  def pick_color(image) do
    # pattern matching strucs
    %Identicon.Image{hex: hex_list} = image
    [r, g, b | _tail] = hex_list # tail have the rest of the list
    #[r, g, b] instead of do it we are assigning the colors to a Image struct in color var

    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list 

    %Identicon.Image{hex: hex}
  end
end 
