defmodule Sample.Schemas do
  alias OpenApiSpex.Schema

  defmodule Book do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "Book",
      description: "Book object - example of missing validation",
      type: :object,
      properties: %{
        author: %Schema{description: "Book author", type: :string},
        title: %Schema{description: "Book title", type: :string},
        published: %Schema{description: "Published timestamp", type: :string, format: :'date-time'},
      },
      example: %{
        author: "John",
        title: "Encyclopedia",
        published: "2018-01-20T12:00:00"
      }
    })
  end

  defmodule ArticleWrong do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "ArticleWrong",
      description: "Article object - example of present validation",
      type: :object,
      properties: %{
        author: %Schema{description: "Article author", type: :string},
        title: %Schema{description: "Article title", type: :string},
        published: %Schema{description: "Published timestamp", type: :string, format: :'date-time'},
      },
      example: %{
        "author" => "Peter",
        "title" => "Nature",
        "published" => "2018-01-20T12:00:00"
      }
    })
  end

  defmodule ArticleCorrect do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "ArticleCorrect",
      description: "Article object - example of present succesfull validation",
      type: :object,
      properties: %{
        author: %Schema{description: "Article author", type: :string},
        title: %Schema{description: "Article title", type: :string},
        published: %Schema{description: "Published timestamp", type: :string, format: :'date-time'},
      },
      example: %{
        "author" => "Peter",
        "title" => "Nature",
        "published" => "2018-01-20T12:00:00Z"
      }
    })
  end

  defmodule BooksResponse do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "BooksResponse",
      description: "Response schema for list of books",
      type: :object,
      properties: %{
        books: %Schema{description: "List of book objects", type: :array, items: Book},
        wrong_articles: %Schema{description: "List of wrong article objects", type: :array, items: ArticleWrong},
        correct_articles: %Schema{description: "List of correct article objects", type: :array, items: ArticleCorrect},
      },
    })
  end
end
