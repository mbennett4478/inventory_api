defmodule BsmpleInventory.Inventory.Container do
  use Ecto.Schema
  import Ecto.Changeset
  alias BsmpleInventory.Inventory.InventoryItem

  schema "container" do
    field :name, :string

    has_many :items, InventoryItem

    timestamps()
  end

  @doc false
  def changeset(container, attrs) do
    container
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
