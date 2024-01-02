defmodule Categories.Categories do
  @moduledoc """
    The Categories context
  """

  alias Categories.Repo
  alias Category

  def all, do: Repo.all(Category) |> Repo.preload(:courses)

  def create(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end
end
