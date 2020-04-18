defmodule BsmpleInventory.Repo.Migrations.CreateContainer do
  use Ecto.Migration

  def change do
    create table(:container) do
      add :name, :string
      add :quantity, :integer

      timestamps()
    end

  end
end
