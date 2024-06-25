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
    Multidict.new()
  end

  def add_entry(todo_list, entry) do
    Multidict.add(todo_list, entry.date, entry.title)
  end

  def entries(todo_list, date) do
    Multidict.get(todo_list, date)
  end

  def start() do
    todos =
      Todo.new()
      |> Todo.add_entry(%{date: ~D[2023-12-19], title: "Dentist"})
      |> Todo.add_entry(%{date: ~D[2023-12-11], title: "Supermarket"})
      |> Todo.add_entry(%{date: ~D[2023-12-11], title: "Work"})

    Todo.entries(todos, ~D[2023-12-11])
  end
end
