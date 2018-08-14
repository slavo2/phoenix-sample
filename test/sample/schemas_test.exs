defmodule Sample.SchemasTest do
  use ExUnit.Case

  import OpenApiSpex.Test.Assertions

  test "Book Schema incorrectly passes validation" do
    api_spec = Sample.ApiSpec.spec()
    schema = Sample.Schemas.Book.schema()

    assert_schema(schema.example, "Book", api_spec)
  end

  test "ArticleWrong Schema correctly fails validation" do
    api_spec = Sample.ApiSpec.spec()
    schema = Sample.Schemas.ArticleWrong.schema()

    assert_schema(schema.example, "ArticleWrong", api_spec)
  end

  test "ArticleCorrect Schema correctly passes validation" do
    api_spec = Sample.ApiSpec.spec()
    schema = Sample.Schemas.ArticleCorrect.schema()

    assert_schema(schema.example, "ArticleCorrect", api_spec)
  end
end
