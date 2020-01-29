defmodule ClaritasTest do
  use ExUnit.Case
  doctest Claritas

  test "Color is not a string" do
    assert match?({:error, _}, Claritas.shift(123, 20))
  end

  test "Second param is not integer" do
    assert match?({:error, _}, Claritas.shift("#f06d06", "a"))
  end

  test "Lighten color successfully" do
    assert match?({:ok, "#FF8B24"}, Claritas.shift("#f06d06", 30))
  end

  test "Darken color successfully" do
    assert match?({:ok, "#FF8B24"}, Claritas.shift("#f06d06", 30))
  end
end
