class Login
	attr_reader :nickname, :pin, :message
	def initialize (nickname, pin)
		@nickname = nickname
		@pin = pin
	end

	def verify_login
		if @nickname==""
			@message = "Please enter a nickname."
			return false
		elsif @pin.length<4 || @pin=="" || !@pin.match(/\d/)
			@message = "Please enter a 4 Digit PIN.  ex:( 1234 )"
			return false
		else
			return true
		end
	end
end