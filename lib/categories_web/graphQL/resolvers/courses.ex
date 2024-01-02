defmodule CategoriesWeb.GraphQL.Resolvers.Courses do
  @moduledoc """
  The Courses resolver module is used to resolve the GraphQL queries and mutations.
  """
  def list(_root, _params, _) do
    Courses.all()
  end

  def create(_root, params, _) do
    case Courses.create(params) do
      {:ok, course} -> {:ok, course}
      {:error, changeset} -> {:error, changeset}
    end
  end
end
