defmodule BsmpleInventory.Repo do
  use Ecto.Repo,
    otp_app: :bsmple_inventory,
    adapter: Ecto.Adapters.Postgres
end
