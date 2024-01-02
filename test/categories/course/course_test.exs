defmodule Categories.CourseTest do
  @moduledoc false
  use Categories.DataCase
  import Categories.Factory

  describe "changeset/2" do
    test "creates a course with valid data" do
      changeset =
        :course
        |> params_for()
        |> Map.put(:category_id, 1)
        |> Course.changeset()

      assert changeset.valid?
    end

    test "requires a name" do
      changeset =
        :course
        |> params_for(name: nil)
        |> Map.put(:category_id, 1)
        |> Course.changeset()

      assert changeset.valid? == false
      assert changeset.errors[:name] == {"can't be blank", [validation: :required]}
    end

    test "not require a description" do
      changeset =
        :course
        |> params_for()
        |> Map.put(:category_id, 1)
        |> Course.changeset()

      assert changeset.valid? == true
    end

    test "requires a category_id" do
      changeset =
        :course
        |> params_for()
        |> Course.changeset()

      assert changeset.valid? == false
    end
  end
end
