defmodule Categories.Categories do
  @moduledoc """
    The Categories context
  """

  alias Category
  alias Categories.Repo

  def all, do: Repo.all(Category) |> Repo.preload(:courses)

  def create(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end
end
