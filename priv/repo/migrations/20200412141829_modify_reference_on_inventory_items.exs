defmodule BsmpleInventory.Repo.Migrations.ModifyReferenceOnInventoryItems do
  use Ecto.Migration

  def up do
    execute "ALTER TABLE inventory_item DROP CONSTRAINT inventory_item_container_id_fkey"
    execute "ALTER TABLE inventory_item DROP CONSTRAINT inventory_item_item_id_fkey"

    alter table(:inventory_item) do
      modify(:container_id, references(:container, on_delete: :delete_all), null: false)
      modify(:item_id, references(:items, on_delete: :delete_all), null: false)
    end
  end

  def down do
    execute "ALTER TABLE inventory_item DROP CONSTRAINT inventory_item_container_id_fkey"
    execute "ALTER TABLE inventory_item DROP CONSTRAINT inventory_item_item_id_fkey"

    alter table(:inventory_item) do
      modify(:container_id, references(:container, on_delete: :nothing), null: false)
      modify(:item_id, references(:items, on_delete: :nothing), null: false)
    end
  end
end
