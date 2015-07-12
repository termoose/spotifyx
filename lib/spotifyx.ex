defmodule Spotifyx do
	@moduledoc """
  Wraps the Spotify API in a GenServer
  """
	use Application

	def start(_type, _args) do
		IO.puts "Application start"
		import Supervisor.Spec, warn: false

		children = [
								 worker(Spotifyx.Api, [])
						 ]

		opts = [strategy: :one_for_one]
		Supervisor.start_link(children, opts)
	end		
end
