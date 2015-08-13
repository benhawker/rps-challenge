class Game

OPTIONS = { :rock => :paper,
            :paper => :scissors,
            :scissors => :rock }

COMPUTER_CHOICES = [:rock, :paper, :scissors]
DEFAULT_BEST_OF = 3

  attr_reader :player_1_count, :player_2_count
  attr_accessor :best_of

  def initialize (best_of = DEFAULT_BEST_OF)
  	@best_of = best_of
  	@player_1_count = 0 
  	@player_2_count = 0
  end

	def play (player1, player2)
		if player1 == player2
			:draw
		elsif OPTIONS[player1] == player2
    	@player_2_count += 1
    	:p2_wins
  	else
  		@player_1_count += 1
    	:p1_wins
		end
	end

	def user_choice (choice)
		@choice = choice
	end

	def computer_choice
		COMPUTER_CHOICES.sample
	end

	def winner?
		true if @player_1_count > (@best_of/2) || @player_2_count > (@best_of/2)
	end

end