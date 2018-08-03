defmodule Sample.Schemas do
  alias OpenApiSpex.Schema

  defmodule Book do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "Book",
      description: "Book object",
      type: :object,
      properties: %{
        author: %Schema{description: "Book author", type: :string, example: "John"},
        title: %Schema{description: "Book title", type: :string, example: "Encyclopedia"},
      },
    })
  end

  defmodule BooksResponse do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "BooksResponse",
      description: "Response schema for list of books",
      type: :object,
      properties: %{
        books: %Schema{description: "List of book objects", type: :array, items: Book}
      },
    })
  end
end
