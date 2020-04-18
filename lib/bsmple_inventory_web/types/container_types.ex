
defmodule BsmpleInventoryWeb.Types.ContainerTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: BsmpleInventory.Repo

  @desc "Container"
  object :container do
    @desc "The container id"
    field :id, :id
    @desc "The name of the container"
    field :name, :string
    @desc "The container items"
    field :items, list_of(:inventory_item), resolve: assoc(:items)
  end

  @desc "Item"
  object :item do
    @desc "Item Id"
    field :id, :id
    @desc "Item name"
    field :name, :string
    @desc "Item description"
    field :description, :string
  end

  @desc "Inventory item"
  object :inventory_item do
    @desc "container id"
    field :container_id, :id
    @desc "Item quantity"
    field :quantity, :integer
    @desc "Acutal Item composed"
    field :item, :item, resolve: assoc(:item)
  end

  @desc "Input Inventory Item"
  input_object :input_inventory_item do
    @desc "Item id"
    field :item_id, non_null(:id)
    @desc "Quantity"
    field :quantity, non_null(:integer)
  end
end
