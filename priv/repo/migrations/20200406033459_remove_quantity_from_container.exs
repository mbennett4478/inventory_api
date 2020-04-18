defmodule BsmpleInventory.Repo.Migrations.RemoveQuantityFromContainer do
  use Ecto.Migration

  def change do
    alter table(:container) do
      remove :quantity
    end
  end
end
