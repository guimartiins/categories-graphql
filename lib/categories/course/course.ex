defmodule Course do
  @moduledoc """
  The Course module is used to define the Course schema.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name category_id)a

  schema "courses" do
    field :name, :string
    field :description, :string

    belongs_to :categories, Category, foreign_key: :category_id
    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, [:name, :description, :category_id])
    |> validate_required(@required_fields)
  end
end
