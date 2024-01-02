defmodule Categories.CoursesTest do
  @moduledoc false
  use Categories.DataCase
  import Categories.Factory

  describe "all/0" do
    test "return an empty list when is not categories in database" do
      assert Courses.all() == []
    end

    test "return a list of categories when is categories in database" do
      insert_list(10, :course)
      assert length(Courses.all()) == 10
    end
  end

  describe "create/1" do
    test "creates a courses with valid data" do
      %{id: category_id} = insert(:category)

      {:ok, course} =
        :course
        |> params_for()
        |> Map.put(:category_id, category_id)
        |> Courses.create()

      assert course.id
      assert course.name
      assert course.description
    end
  end
end
