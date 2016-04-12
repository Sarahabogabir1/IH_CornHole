class Dumy_database
	attr_accessor :player_data, :ironhack_march
	def initialize
		@player_data = [
			{:first_name => "Al", :last_name => "Delcy", :email => "aldelcy2000@gmail.com", :nickname => "aldelcy", :pin => 1234, :stat =>{:win => 12, :losse => 8, :tie => 2} },
			{:first_name => "Alvaro", :last_name => "noidea", :email => "something@gmail.com", :nickname => "alvaro", :pin => 5678, :stat =>{:win => 10, :losse => 4, :tie => 6} }
		]
	end

	def teams
		@ironhack_march = {
			:blue_team => [@player_data[0][:nickname]],
			:white_team => [@player_data[1][:nickname]]
		}
	end

end

test = Dumy_database.new

puts test.teams
