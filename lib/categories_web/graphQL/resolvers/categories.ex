defmodule CategoriesWeb.GraphQL.Resolvers.Categories do
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
