class Team
	attr_accessor :name 
	attr_reader :stat
	def initialize (name)
		@name = name
		@team_stat = team_stat
		@players = []
	end

	def add_player(player)
		@players << player
	end
end