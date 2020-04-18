defmodule BsmpleInventoryWeb.Schema do
  use Absinthe.Schema
  alias BsmpleInventoryWeb.Resolvers.{PostResolver, ContainerResolver}

  import_types BsmpleInventoryWeb.Types.{PostTypes, ContainerTypes}

  query do
    @desc "list_all_posts"
    field :posts, list_of(:post) do
      resolve &PostResolver.list_all_posts/3
    end

    @desc "list_all_conatiners"
    field :containers, list_of(:container) do
      resolve &ContainerResolver.list_all_containers/3
    end

    @desc "list_all_items"
    field :items, list_of(:item) do
      resolve &ContainerResolver.list_all_items/3
    end
  end

  mutation do
    @desc "create_post"
    field :create_post, :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)

      resolve &PostResolver.create_post/3
    end

    @desc "create_container"
    field :create_container, :container do
      arg :name, non_null(:string)

      resolve &ContainerResolver.create_container/3
    end

    @desc "delete_container"
    field :delete_container, :container do
      arg :id, non_null(:id)

      resolve &ContainerResolver.delete_container/3
    end

    @desc "add_inventory_item"
    field :add_inventory_item, :inventory_item do
      arg :container_id, non_null(:id)
      arg :item_id, non_null(:id)
      arg :quantity, non_null(:integer)

      resolve &ContainerResolver.add_inventory_item/3
    end

    @desc "delete_inventory_item"
    field :remove_inventory_item, :inventory_item do
      arg :id, non_null(:id)

      resolve &ContainerResolver.remove_inventory_item/3
    end

    @desc "create_item"
    field :create_item, :item do
      arg :name, non_null(:string)
      arg :description, :string

      resolve &ContainerResolver.create_item/3
    end
  end
end
