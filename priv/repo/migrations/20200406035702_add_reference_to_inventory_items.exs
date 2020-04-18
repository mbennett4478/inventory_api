defmodule BsmpleInventory.Repo.Migrations.AddReferenceToInventoryItems do
  use Ecto.Migration

  def change do
    alter table(:inventory_item) do
      add :item_id, references(:items, on_delete: :nothing), null: false
    end

    create index(:inventory_item, [:container_id, :item_id])
  end
end
