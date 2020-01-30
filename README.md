# Claritas

 [![Hex.pm](https://img.shields.io/hexpm/v/claritas.svg?maxAge=2592000)](https://hex.pm/packages/claritas)

Library for generating different variations of brightness for given color.

## Installation

The package can be installed by adding `claritas` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:claritas, "~> 0.1.1"}
  ]
end
```

and running `mix deps.get` in your console to fetch from Hex.

## Basic Usage

### positive values are lightening the color

```
iex> Claritas.shift("#f06d06", 30)
{:ok, "#FF8B24"}
```

### negative values are darkening the color

```
iex> Claritas.shift("#f06d06", -30)
{:ok, "#D24F00"}
```

### Dynamically increase/decrease brightness of your colors.

Controller:

```
def index(conn, _params) do
  shades =
    for i <- 1..20, into: [] do
      Claritas.shift("#141C5B", 10 * i)
    end

  render(conn, "index.html", shades: shades)
end
```

Template:

```
<ul>
  <%= for {_, shade} <- @shades do %>
    <li><span style='background-color: <%= shade %>'><%= shade %></span></li>
  <% end %>
</ul>
```

## Author
Rafał Golarz

Claritas is released under the [MIT License](https://github.com/rafalgolarz/claritas/blob/master/LICENSE.txt).