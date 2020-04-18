defmodule BsmpleInventory.Inventory.InventoryItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias BsmpleInventory.Inventory.{Item, Container}

  schema "inventory_item" do
    field :quantity, :integer
    belongs_to :container, Container
    belongs_to :item, Item
  end

  @doc false
  def changeset(inventory_item, attrs) do
    inventory_item
    |> cast(attrs, [:quantity, :container_id, :item_id])
    |> validate_required([:quantity, :container_id, :item_id])
  end
end
