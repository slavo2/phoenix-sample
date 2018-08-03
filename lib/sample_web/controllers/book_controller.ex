defmodule SampleWeb.BookController do
  use SampleWeb, :controller

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
