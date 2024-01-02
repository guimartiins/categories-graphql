defmodule Categories.CategoryTest do
  @moduledoc false
  use Categories.DataCase
  import Categories.Factory

  describe "changeset/2" do
    test "creates a category with valid data" do
      changeset =
        :category
        |> params_for()
        |> Category.changeset()

      assert changeset.valid?
    end

    test "requires a name" do
      changeset =
        :category
        |> params_for(name: nil)
        |> Category.changeset()

      assert changeset.valid? == false
      assert changeset.errors[:name] == {"can't be blank", [validation: :required]}
    end

    test "not require a description" do
      changeset =
        :category
        |> params_for()
        |> Category.changeset()

      assert changeset.valid? == true
    end
  end
end
