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

  def update_entry(todo_list, entry_id, updater_fun) do
    case Map.fetch(todo_list.entries, entry_id) do
      :error ->
        todo_list
      {:ok, old_entry} ->
        new_entry = updater_fun.(old_entry)
        new_entries = Map.put(todo_list.entries, new_entry.id, new_entry)
        %Todolist{todo_list | entries: new_entries}
    end
  end

  def delete_entry(todo_list, entry_id) do
    new_entries = Map.delete(todo_list.entries, entry_id)
    %Todolist{todo_list | entries: new_entries}
  end

  def start() do
    todos =
      Todolist.new()
      |> Todolist.add_entry(%Todo{date: ~D[2023-12-19], title: "Dentist"})
      |> Todolist.add_entry(%Todo{date: ~D[2023-12-11], title: "Supermarket"})
      |> Todolist.add_entry(%Todo{date: ~D[2023-12-11], title: "Work"})
      |> Todolist.add_entry(%Todo{date: ~D[2024-06-26], title: "Bills"})
    IO.puts("initialized todos:")
    IO.inspect(todos)
    IO.puts("\n")

    IO.puts("filtered todos:")
    IO.inspect(Todolist.entries(todos, ~D[2023-12-11]))
    IO.puts("\n")

    IO.puts("updated entry:")
    IO.inspect(update_entry(todos, 0, &Map.put(&1, :date, ~D[2023-12-20])))
    IO.puts("\n")

    IO.puts("deleted entry:")
    IO.inspect(delete_entry(todos, 2))
    IO.puts("\n")

    IO.puts("see, original items weren't affected")
    todos

  end
end
