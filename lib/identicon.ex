defmodule Identicon do

    # Pipe Operator
    def main(input) do
      input
      |> hash_input
      |> pick_color
    end

    # Asigns hex to equal pairs then to an RGB
    def pick_color(%Identicon.Image{hex: [r, g, b |  _tail]} = image) do
      #[r, g, b |  _tail] =  hex_list
      #[r, g, b]
      %Identicon.Image{image | color: {r, g, b}}
    end

    # Takes input and returns a Hex
    def hash_input(input) do
      hex = :crypto.hash(:md5, input)
      |> :binary.bin_to_list

      %Identicon.Image{hex: hex}
    end



end
