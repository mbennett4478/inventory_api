defmodule BsmpleInventory.Repo.Migrations.CreateInventoryItem do
  use Ecto.Migration

  def change do
    create table(:inventory_item) do
      add :quantity, :integer
      add :container_id, references(:container, on_delete: :nothing), null: false
    end

    create index(:inventory_item, [:container_id])
  end
end
