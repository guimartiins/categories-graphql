defmodule Categories.Factory do
  @moduledoc """
  The Factory module is used to generate data for testing.
  """
  use ExMachina.Ecto, repo: Categories.Repo

  def category_factory do
    %Category{
      name: Faker.Lorem.word(),
      description: Faker.Lorem.sentence()
    }
  end

  def course_factory do
    %{id: category_id} = build(:category)

    %Course{
      name: Faker.Lorem.word(),
      description: Faker.Lorem.sentence(),
      category_id: category_id
    }
  end
end
