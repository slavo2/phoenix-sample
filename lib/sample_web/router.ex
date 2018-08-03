defmodule SampleWeb.Router do
  use SampleWeb, :router

  pipeline :api do
    plug OpenApiSpex.Plug.PutApiSpec, module: Sample.ApiSpec
    plug :accepts, ["json"]
  end

  scope "/" do
    get "/swaggerui", OpenApiSpex.Plug.SwaggerUI, path: "/api/openapi"
  end

  scope "/api" do
    pipe_through :api

    get "/book", SampleWeb.BookController, :index

    get "/openapi", OpenApiSpex.Plug.RenderSpec, []
  end
end
