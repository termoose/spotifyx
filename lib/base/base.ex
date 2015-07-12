defmodule Spotifyx.Base do
	use HTTPoison.Base

	def process_url(url) do
		"https://api.spotify.com" <> url
	end

	def process_response_body(body) do
		body
		|> Poison.decode!
	end
end
