defmodule Todo do
  @moduledoc """
  Documentation for `Todo`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Todo.hello()
      :world

  """
  def new do
    Multidict.new
  end

  def add_entry(todo_list, date, title) do
    Multidict.add(todo_list, date, title)
  end

  def start() do
      Todo.new()
      |> Todo.add_entry(~D[2023-12-19], "Dentist")
      |> Todo.add_entry(~D[2023-12-11], "Supermarket")
      |> Todo.add_entry(~D[2023-12-11], "Work")

  end
end
