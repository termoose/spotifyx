defmodule Spotifyx.Api do
	use GenServer

	def start_link do
		GenServer.start_link(__MODULE__, [], [name: __MODULE__])
	end

	@doc """
  Does a search query and returns the first match
  """
	def search(query) do
		GenServer.call(__MODULE__, {:query, query})
	end

	def handle_call({:query, query}, _from, []) do
		IO.puts "handle_call called"
		{:reply, get_track(query), []}
	end

	defp get_track(query) do
		try do
			{:ok, res} = Spotifyx.Base.get "/v1/search", [], params: %{q: query, type: "track", limit: 1}
			%{"tracks" => %{"items" => [track|_tracks]}} = res.body
			
			%{"name" => track_name} = track
			%{"album" => %{"name" => album_name}} = track
			%{"artists" => [%{"name" => artist_name} | _artists]} = track
			%{"external_urls" => %{"spotify" => url}} = track
			
			{:ok, {track_name, album_name, artist_name, url}}
		rescue
			_ -> {:fail, "Query failed"}
		end
	end
end
