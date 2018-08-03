defmodule SampleWeb.BookController do
  use SampleWeb, :controller

  alias OpenApiSpex.Operation
  alias Sample.Schemas.BooksResponse

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
