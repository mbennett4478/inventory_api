defmodule BsmpleInventoryWeb.Router do
  use BsmpleInventoryWeb, :router

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  # scope "/", BsmpleInventoryWeb do
  #   pipe_through :api
  # end

  forward "/graphql", Absinthe.Plug, schema: BsmpleInventoryWeb.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: BsmpleInventoryWeb.Schema, interface: :playground
end
