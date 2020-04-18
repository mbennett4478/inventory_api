defmodule BsmpleInventory.InventoryTest do
  use BsmpleInventory.DataCase

  alias BsmpleInventory.Inventory

  describe "items" do
    alias BsmpleInventory.Inventory.Item

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Inventory.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Inventory.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Inventory.create_item(@valid_attrs)
      assert item.description == "some description"
      assert item.name == "some name"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Inventory.update_item(item, @update_attrs)
      assert item.description == "some updated description"
      assert item.name == "some updated name"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_item(item, @invalid_attrs)
      assert item == Inventory.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Inventory.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Inventory.change_item(item)
    end
  end

  describe "container" do
    alias BsmpleInventory.Inventory.Container

    @valid_attrs %{name: "some name", quantity: 42}
    @update_attrs %{name: "some updated name", quantity: 43}
    @invalid_attrs %{name: nil, quantity: nil}

    def container_fixture(attrs \\ %{}) do
      {:ok, container} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_container()

      container
    end

    test "list_container/0 returns all container" do
      container = container_fixture()
      assert Inventory.list_container() == [container]
    end

    test "get_container!/1 returns the container with given id" do
      container = container_fixture()
      assert Inventory.get_container!(container.id) == container
    end

    test "create_container/1 with valid data creates a container" do
      assert {:ok, %Container{} = container} = Inventory.create_container(@valid_attrs)
      assert container.name == "some name"
      assert container.quantity == 42
    end

    test "create_container/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_container(@invalid_attrs)
    end

    test "update_container/2 with valid data updates the container" do
      container = container_fixture()
      assert {:ok, %Container{} = container} = Inventory.update_container(container, @update_attrs)
      assert container.name == "some updated name"
      assert container.quantity == 43
    end

    test "update_container/2 with invalid data returns error changeset" do
      container = container_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_container(container, @invalid_attrs)
      assert container == Inventory.get_container!(container.id)
    end

    test "delete_container/1 deletes the container" do
      container = container_fixture()
      assert {:ok, %Container{}} = Inventory.delete_container(container)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_container!(container.id) end
    end

    test "change_container/1 returns a container changeset" do
      container = container_fixture()
      assert %Ecto.Changeset{} = Inventory.change_container(container)
    end
  end

  describe "inventory_item" do
    alias BsmpleInventory.Inventory.InventoryItem

    @valid_attrs %{quantity: 42}
    @update_attrs %{quantity: 43}
    @invalid_attrs %{quantity: nil}

    def inventory_item_fixture(attrs \\ %{}) do
      {:ok, inventory_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_inventory_item()

      inventory_item
    end

    test "list_inventory_item/0 returns all inventory_item" do
      inventory_item = inventory_item_fixture()
      assert Inventory.list_inventory_item() == [inventory_item]
    end

    test "get_inventory_item!/1 returns the inventory_item with given id" do
      inventory_item = inventory_item_fixture()
      assert Inventory.get_inventory_item!(inventory_item.id) == inventory_item
    end

    test "create_inventory_item/1 with valid data creates a inventory_item" do
      assert {:ok, %InventoryItem{} = inventory_item} = Inventory.create_inventory_item(@valid_attrs)
      assert inventory_item.quantity == 42
    end

    test "create_inventory_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_inventory_item(@invalid_attrs)
    end

    test "update_inventory_item/2 with valid data updates the inventory_item" do
      inventory_item = inventory_item_fixture()
      assert {:ok, %InventoryItem{} = inventory_item} = Inventory.update_inventory_item(inventory_item, @update_attrs)
      assert inventory_item.quantity == 43
    end

    test "update_inventory_item/2 with invalid data returns error changeset" do
      inventory_item = inventory_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_inventory_item(inventory_item, @invalid_attrs)
      assert inventory_item == Inventory.get_inventory_item!(inventory_item.id)
    end

    test "delete_inventory_item/1 deletes the inventory_item" do
      inventory_item = inventory_item_fixture()
      assert {:ok, %InventoryItem{}} = Inventory.delete_inventory_item(inventory_item)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_inventory_item!(inventory_item.id) end
    end

    test "change_inventory_item/1 returns a inventory_item changeset" do
      inventory_item = inventory_item_fixture()
      assert %Ecto.Changeset{} = Inventory.change_inventory_item(inventory_item)
    end
  end
end
