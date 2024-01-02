defmodule CategoriesWeb.GraphQL.Resolvers.Courses do
  def list(_root, _params, _) do
    Categories.Courses.all()
  end

  def create(_root, params, _) do
    case Categories.Courses.create(params) do
      {:ok, course} -> {:ok, course}
      {:error, changeset} -> {:error, changeset}
    end
  end
end
