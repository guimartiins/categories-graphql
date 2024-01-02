defmodule Category do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name)a

  schema "categories" do
    field :name, :string
    field :description, :string

    has_many :courses, Course

    timestamps()
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:name, :description])
    |> validate_required(@required_fields)
  end
end
