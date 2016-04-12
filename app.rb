require "sinatra"
require "sinatra/reloader"
require_relative "lib/player.rb"
require_relative "lib/login.rb"
require_relative "lib/team.rb"

enable(:sessions)

title = "Score Keeper0"
slogan = "Dominate your game"

get "/?" do
	@title = title
	@slogan = slogan
	erb(:home)
end

post "/?" do
	@nickname = params[:nickname]
	@pin = params[:pin]

	login = Login.new(@nickname, @pin)
	login.verify_login

	@title = title
	@slogan = slogan

	if login.verify_login==true
		# Check YAML for data, if nickname and pin exists, create sessions[fname, lastname, nickname... ect] and move to new home
			@submit = params[:submit]
			session[:nickname] = @nickname
			erb(:home)
		# else
			# @error = "Nickname and PIN not found. Please verify and try again."
			# @error_class = "login"
			# erb(:error)
		# end
	else
		@error = login.message
		@error_class = "login"
		erb(:error)
	end
end

get "/logout" do
	session.clear
	redirect "/"
end


get "/sign_up" do
	@title = title
	@slogan = slogan
	erb(:sign_up)
end

post "/sign_up" do
	@fname = params[:fname]
	@lname = params[:lname]
	nickname = params[:nickname]
	email = params[:email]
	pin = params[:pin]
	@submit = params[:submit]


	@title = title
	@slogan = slogan


	new_player = Player.new(@fname, @lname, nickname, email, pin)
	new_player.check_valid

	if new_player.check_valid==true

		new_player.save_player
		# if new_player.save_player==true
			erb(:sign_up)
		# else
		# 	@error = new_player.message
		# 	erb(:error)
		# end
	else
		@error = new_player.message
		@error_class = "signup"
		session[:my_previous_url] = URI(request.referer || '').path
		@back_url = session[:my_previous_url]
		erb(:error)
	end

end