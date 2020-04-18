defmodule BsmpleInventoryWeb.Resolvers.PostResolver do
  alias BsmpleInventory.Blog

  def list_all_posts(_, _, _) do
    {:ok, Blog.list_posts()}
  end

  def create_post(_, args, _) do
    Blog.create_post(args)
  end
end
