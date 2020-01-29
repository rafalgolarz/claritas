defmodule Claritas do
  use Bitwise

  @moduledoc """
  Claritas lighten or darken color (hexadecimal) by integer value.
  """

  @doc """
  Shift brightness (up or down) of the given hexadecimal `color` by integer value `brightness_change`.

  Parameters:

  `color`: color in hexadecimal format (#RRGGBB)

  `brightness_change`: integer value

  ## Examples

      # positive values are lightening the color
      iex> Claritas.shift("#f06d06", 30)
      {:ok, "#FF8B24"}

      # negative values are darkening the color
      iex> Claritas.shift("#f06d06", -30)
      {:ok, "#D24F00"}


  Dynamically increase/decrease brightness of your colors.

      style='background-color: <%= Claritas.shift("#f06d06", @calculated_value) %>'


  """
  def shift(color, _) when not is_binary(color), do: {:error, "color must be a string"}

  def shift(color, brightness_change) when is_integer(brightness_change) do
    hexc =
      color
      |> String.split("#")

    # handle both cases: hex number or hex number started with hash symbol
    hex_color =
      case hexc do
        [_, hex] -> hex
        [hex] -> hex
      end

    int_color = hex_color |> to_charlist() |> List.to_integer(16)

    red = (int_color >>> 16) + brightness_change
    green = (int_color &&& 0x0000FF) + brightness_change
    blue = (int_color >>> 8 &&& 0x00FF) + brightness_change

    red = adjust(red)
    green = adjust(green)
    blue = adjust(blue)

    new_color = (green ||| blue <<< 8 ||| red <<< 16) |> Integer.to_string(16)
    {:ok, "#" <> new_color}
  end

  def shift(_, brightness_change) when not is_integer(brightness_change),
    do: {:error, "second parameter must be integer"}

  # let's ensure values belong to RGB range
  defp adjust(intensity) when intensity > 255, do: 255
  defp adjust(intensity) when intensity < 0, do: 0
  defp adjust(intensity), do: intensity
end
