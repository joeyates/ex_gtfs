defmodule ExGTFS.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_gtfs,
      version: "0.2.0",
      elixir: "~> 1.14",
      description: "Parse GTFS files",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:csv, ">= 0.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/joeyates/exiffer"
      },
      maintainers: ["Joe Yates"]
    }
  end
end
