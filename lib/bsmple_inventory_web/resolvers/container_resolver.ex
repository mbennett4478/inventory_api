defmodule BsmpleInventoryWeb.Resolvers.ContainerResolver do
  alias BsmpleInventory.Inventory

  def list_all_containers(_, _, _) do
    {:ok, Inventory.list_container}
  end

  def create_container(_, args, _) do
    Inventory.create_container(args)
  end

  def delete_container(_, args, _) do
    Inventory.delete_container(args)
  end

  def list_all_items(_, _, _) do
    {:ok, Inventory.list_items}
  end

  def create_item(_, args, _) do
    Inventory.create_item(args)
  end

  def add_inventory_item(_, args, _) do
    Inventory.create_inventory_item(args)
  end

  def remove_inventory_item(_, args, _) do
    Inventory.delete_inventory_item(args)
  end
end
