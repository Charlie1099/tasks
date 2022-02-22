defmodule Tasks.TaskTest do
  use Tasks.DataCase

  alias Tasks.Task

  describe "items" do
    alias Tasks.Task.Item

    import Tasks.TaskFixtures

    @invalid_attrs %{completed_at: nil, content: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Task.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Task.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{completed_at: ~U[2022-02-21 04:45:00Z], content: "some content"}

      assert {:ok, %Item{} = item} = Task.create_item(valid_attrs)
      assert item.completed_at == ~U[2022-02-21 04:45:00Z]
      assert item.content == "some content"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Task.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{completed_at: ~U[2022-02-22 04:45:00Z], content: "some updated content"}

      assert {:ok, %Item{} = item} = Task.update_item(item, update_attrs)
      assert item.completed_at == ~U[2022-02-22 04:45:00Z]
      assert item.content == "some updated content"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Task.update_item(item, @invalid_attrs)
      assert item == Task.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Task.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Task.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Task.change_item(item)
    end
  end
end
