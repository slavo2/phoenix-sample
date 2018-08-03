defmodule SampleWeb.Router do
  use SampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SampleWeb do
    pipe_through :api

    get "/book", BookController, :index
  end
end
