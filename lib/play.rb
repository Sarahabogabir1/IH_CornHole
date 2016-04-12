class Play
	attr_reader :team
	def initialize(team1, team2)
		@team1, @team2 = team1, team2
		score = {:@team1 => [], :@team2 => []}
	end

	def score(where)
		if action=="on_board"
			
		end
		if action=="on_ring"

		end
		if action=="in_hole"

		end
	end

	def pushed_bag(player, action)

		if action=="ring_to_board"

		end

		if action=="ring_to_out"

		end
		
		if action=="ring_to_hole"

		end
		
		if action=="board_to_ring"

		end
		
		if action=="board_to_out"

		end
		
		if action=="board_to_hole"

		end
		
	end

end