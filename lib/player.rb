require 'yaml/store'

class Player
	attr_accessor :first_name, :last_name, :nickname, :email, :pin, :message
	attr_reader :stat
	def initialize (fname, lname, nickname, email, pin)
		@last_name, @first_name = lname, fname
		@nickname = nickname
		@pin, @email = pin, email
		@stat = {:win => 0, :losse => 0, :tie => 0}
	end

	def check_valid
		if @first_name=="" || @last_name==""
			@message = "Please enter both a First and a Last name."
			return false
		elsif @first_name =~ /[\d\W]/ || @last_name =~ /[\d\W]/
			@message = "Please enter a valid first and last name"
			return false
		elsif !@email.match(/\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
			@message = "Please input a valid email (something@domain.com)"
			return false
		elsif @pin.length<4 || !@pin.match(/\d/)
			@message = "Please input a valid 4 digit Pin. ex:( 1234 )"
			return false
		else
			return true
		end
	end

	def save_player
		database = YAML::Store.new "./database/database.yml"
		
		database.transaction do
			players = database["players"]

			if players==nil
				players = []
				players << self
				database["players"] = players
			else
				# if players.has_value?(@nickname)
				# 	@message = "Database already has nickname: #{@nickname}. Please choose a unique nickname"
				# 	return false
				# else
			  		players << self
			  		database["players"] = players
			  	# end
			end
		end
	end
end