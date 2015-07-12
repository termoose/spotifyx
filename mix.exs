defmodule Spotifyx.Mixfile do
  use Mix.Project

  def project do
    [app: :spotifyx,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps,
		 package: package]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
		[mod: {Spotifyx, []},
		 applications: [:logger, :poison, :httpoison, :crypto]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
				{:httpoison, "~> 0.7"},
				{:poison, "~> 1.4.0"}
		]
  end

	defp package do
		[contributors: ["Ole Andre Birkedal"]]
	end
end
