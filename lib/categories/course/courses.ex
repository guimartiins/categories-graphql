defmodule Courses do
  @moduledoc """
    The Courses context
  """

  alias Categories.Repo
  alias Course

  def all, do: Repo.all(Course)

  def create(attrs \\ %{}) do
    %Course{}
    |> Course.changeset(attrs)
    |> Repo.insert()
  end
end
