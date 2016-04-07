require "sinatra"
require "sinatra/reloader"

enable(:session)

get "/" do
	
	erb(:signin)
	
end