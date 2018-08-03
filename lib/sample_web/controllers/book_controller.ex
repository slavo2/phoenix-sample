defmodule SampleWeb.BookController do
  use SampleWeb, :controller

  alias OpenApiSpex.{Operation, Schema}
  alias Sample.Schemas.BooksResponse

  plug OpenApiSpex.Plug.Cast
  plug OpenApiSpex.Plug.Validate

  @spec open_api_operation(any) :: Operation.t
  def open_api_operation(action), do: apply(__MODULE__, :"#{action}_operation", [])

  @spec index_operation() :: Operation.t
  def index_operation() do
    %Operation{
      tags: ["book"],
      summary: "List books",
      description: "Just a sample endpoint",
      operationId: "BookController.index",
      parameters: [
        Operation.parameter(:filter, :query, %Schema{
          type: :object,
          required: [:published],
          properties: %{
            name: %Schema{description: "Book title", type: :string, example: "Encyclopedia"},
            edition: %Schema{description: "Book edition", type: :integer, example: 2},
            published: %Schema{description: "Book published date", type: :string, example: "2018-01-01", format: :date},
          }
        }, "Filters", style: :deepObject, explode: true, required: true)
      ],
      responses: %{
        200 => Operation.response("Books", "application/json", BooksResponse)
      },

    }
  end

  def index(conn, _params) do
    data = %{
      books: [
        %{author: "John", title: "Novel"},
        %{author: "Paul", title: "Encyclopedia"},
      ]
    }
    json(conn, data)
  end
end
