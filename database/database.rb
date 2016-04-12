player = [
	{:f_name => "Al", :l_name => "Delcy", :email => "aldelcy2000@gmail.com", :nickname => "aldelcy", :pin => 1234, :stat =>{:win => 12, :losse => 8, :tie => 2} },
	{:f_name => "Alvaro", :l_name => "noidea", :email => "something@gmail.com", :nickname => "alvaro", :pin => 5678, :stat =>{:win => 10, :losse => 4, :tie => 6} }
]

ironhack_march = {
	:blue_team => [player[0][:nickname]],
	:white_team => [player[1][:nickname]]
}

puts ironhack_march