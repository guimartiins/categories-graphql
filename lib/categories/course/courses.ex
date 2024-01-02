defmodule Categories.Courses do
  @moduledoc """
    The Courses context
  """

  alias Course
  alias Categories.Repo

  def all, do: Repo.all(Course)

  def create(attrs \\ %{}) do
    %Course{}
    |> Course.changeset(attrs)
    |> Repo.insert()
  end
end
