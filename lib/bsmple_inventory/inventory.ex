defmodule BsmpleInventory.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias BsmpleInventory.Repo

  alias BsmpleInventory.Inventory.Item

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    Repo.all(Item)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{source: %Item{}}

  """
  def change_item(%Item{} = item) do
    Item.changeset(item, %{})
  end

  alias BsmpleInventory.Inventory.Container

  @doc """
  Returns the list of container.

  ## Examples

      iex> list_container()
      [%Container{}, ...]

  """
  def list_container do
    Container
    |> Repo.all
  end

  @doc """
  Gets a single container.

  Raises `Ecto.NoResultsError` if the Container does not exist.

  ## Examples

      iex> get_container!(123)
      %Container{}

      iex> get_container!(456)
      ** (Ecto.NoResultsError)

  """
  def get_container!(id), do: Repo.get!(Container, id)

  @doc """
  Creates a container.

  ## Examples

      iex> create_container(%{field: value})
      {:ok, %Container{}}

      iex> create_container(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_container(attrs \\ %{}) do
    %Container{}
    |> Repo.preload(:items)
    |> Container.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a container.

  ## Examples

      iex> update_container(container, %{field: new_value})
      {:ok, %Container{}}

      iex> update_container(container, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_container(%Container{} = container, attrs) do
    container
    |> Container.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a container.

  ## Examples

      iex> delete_container(container)
      {:ok, %Container{}}

      iex> delete_container(container)
      {:error, %Ecto.Changeset{}}

  """
  def delete_container(%{id: id}) do
    {value, _ } = Integer.parse(id)
    %Container{id: value}
    |> Repo.delete
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking container changes.

  ## Examples

      iex> change_container(container)
      %Ecto.Changeset{source: %Container{}}

  """
  def change_container(%Container{} = container) do
    Container.changeset(container, %{})
  end

  alias BsmpleInventory.Inventory.InventoryItem

  @doc """
  Returns the list of inventory_item.

  ## Examples

      iex> list_inventory_item()
      [%InventoryItem{}, ...]

  """
  def list_inventory_item do
    Repo.all(InventoryItem)
  end

  @doc """
  Gets a single inventory_item.

  Raises `Ecto.NoResultsError` if the Inventory item does not exist.

  ## Examples

      iex> get_inventory_item!(123)
      %InventoryItem{}

      iex> get_inventory_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inventory_item!(id), do: Repo.get!(InventoryItem, id)

  @doc """
  Creates a inventory_item.

  ## Examples

      iex> create_inventory_item(%{field: value})
      {:ok, %InventoryItem{}}

      iex> create_inventory_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inventory_item(attrs \\ %{}) do
    {:ok, inventory_item} = %InventoryItem{}
    |> InventoryItem.changeset(attrs)
    |> Repo.insert()
    inventory_item = Repo.preload(inventory_item, :item)
    {:ok, inventory_item}
  end

  @doc """
  Updates a inventory_item.

  ## Examples

      iex> update_inventory_item(inventory_item, %{field: new_value})
      {:ok, %InventoryItem{}}

      iex> update_inventory_item(inventory_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inventory_item(%InventoryItem{} = inventory_item, attrs) do
    inventory_item
    |> InventoryItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inventory_item.

  ## Examples

      iex> delete_inventory_item(inventory_item)
      {:ok, %InventoryItem{}}

      iex> delete_inventory_item(inventory_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inventory_item(%InventoryItem{} = inventory_item) do
    Repo.delete(inventory_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inventory_item changes.

  ## Examples

      iex> change_inventory_item(inventory_item)
      %Ecto.Changeset{source: %InventoryItem{}}

  """
  def change_inventory_item(%InventoryItem{} = inventory_item) do
    InventoryItem.changeset(inventory_item, %{})
  end
end
