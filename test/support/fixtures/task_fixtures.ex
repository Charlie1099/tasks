defmodule Tasks.TaskFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tasks.Task` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        completed_at: ~U[2022-02-21 04:45:00Z],
        content: "some content"
      })
      |> Tasks.Task.create_item()

    item
  end
end
