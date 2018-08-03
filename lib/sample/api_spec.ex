defmodule Sample.ApiSpec do
  alias OpenApiSpex.{OpenApi, Server, Info, Paths}

  def spec do
    %OpenApi{
      servers: [
        Server.from_endpoint(SampleWeb.Endpoint, otp_app: :sample)
      ],
      info: %Info{
        title: "Sample app",
        version: "1.0",
      },
      paths: Paths.from_router(SampleWeb.Router),
    }
    |> OpenApiSpex.resolve_schema_modules()
  end
end
