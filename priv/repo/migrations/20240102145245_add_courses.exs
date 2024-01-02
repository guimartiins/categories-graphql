defmodule Categories.Repo.Migrations.AddCourses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :name, :string
      add :description, :string
      add :category_id, references(:categories)

      timestamps()
    end
  end
end
