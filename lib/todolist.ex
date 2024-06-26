defmodule Todolist do
  @moduledoc """
  Documentation for `Todo`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Todo.hello()
      :world

  """
  defstruct next_id: 0, entries: %{}

  def new(), do: %Todolist{}

  def add_entry(todo_list, entry) do
    entry = Map.put(entry, :id, todo_list.next_id)
    new_entries =
      Map.put(
        todo_list.entries,
        todo_list.next_id,
        entry
      )
    %Todolist{todo_list | entries: new_entries, next_id: todo_list.next_id + 1}
  end

  def entries(todo_list, date) do
    todo_list.entries
    |> Map.values()
    |> Enum.filter(fn entry -> entry.date == date end)
  end

  def start() do
    todos =
      Todolist.new()
      |> Todolist.add_entry(%Todo{date: ~D[2023-12-19], title: "Dentist"})
      |> Todolist.add_entry(%Todo{date: ~D[2023-12-11], title: "Supermarket"})
      |> Todolist.add_entry(%Todo{date: ~D[2023-12-11], title: "Work"})
      |> Todolist.add_entry(%Todo{date: ~D[2024-06-26], title: "Bills"})

    Todolist.entries(todos, ~D[2023-12-11])
  end
end
