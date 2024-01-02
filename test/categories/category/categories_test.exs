defmodule Categories.CategoriesTest do
  @moduledoc false
  use Categories.DataCase
  import Categories.Factory
  alias Categories.Categories

  describe "all/0" do
    test "return an empty list when is not categories in database" do
      assert Categories.all() == []
    end

    test "return a list of categories when is categories in database" do
      insert_list(10, :category)
      assert length(Categories.all()) == 10
    end
  end

  describe "create/1" do
    test "creates a category with valid data" do
      {:ok, category} =
        :category
        |> params_for()
        |> Categories.create()

      assert category.id
      assert category.name
      assert category.description
    end
  end
end
