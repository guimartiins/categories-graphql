defmodule CategoriesWeb.Schema do
  @moduledoc """
  The Schema module is used to define the GraphQL schema.
  """

  use Absinthe.Schema
  alias CategoriesWeb.GraphQL.Resolvers

  import_types(Absinthe.Type.Custom)

  object :category do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :description, :string
    field :courses, non_null(list_of(:course))
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  object :course do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :description, :string
    field :category, non_null(:category)
  end

  query do
    @desc "List categories"
    field :list_categories, list_of(:category) do
      resolve(&Resolvers.Categories.list/3)
    end

    @desc "List all courses"
    field :list_courses, list_of(:course) do
      resolve(&Resolvers.Courses.list/3)
    end
  end

  mutation do
    @desc "Create a category"
    field :create_category, type: :category do
      arg(:name, non_null(:string))
      arg(:description, :string)

      resolve(&CategoriesWeb.GraphQL.Resolvers.Categories.create/3)
    end

    @desc "Create a course"
    field :create_course, type: :course do
      arg(:name, non_null(:string))
      arg(:description, :string)
      arg(:category_id, non_null(:id))

      resolve(&Resolvers.Courses.create/3)
    end
  end
end
