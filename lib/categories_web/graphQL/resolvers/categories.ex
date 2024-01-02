defmodule CategoriesWeb.GraphQL.Resolvers.Categories do
  @moduledoc """
  The Categories resolver module is used to resolve the GraphQL queries and mutations.
  """

  alias Categories.Categories

  def list(_root, _params, _) do
    {:ok, Categories.all()}
  end

  def create(_root, params, _) do
    case Categories.create(params) do
      {:ok, category} -> {:ok, category}
      {:error, changeset} -> {:error, changeset}
    end
  end
end
