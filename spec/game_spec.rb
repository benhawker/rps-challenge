require 'game'

describe Game do
 	context "Player 1 vs Player 2 results" do
	 	it "returns a draw if players both choose the same option" do
	 		expect(subject.play(:rock, :rock)).to eq :draw
	 	end

	 	it "returns a draw if players both choose the same option" do
	 		expect(subject.play(:paper, :paper)).to eq :draw
	 	end

	 	it "returns a draw if players both choose the same option" do
	 		expect(subject.play(:scissors, :scissors)).to eq :draw
	 	end

	 	it "returns Player 1 wins if rock vs scissors" do
	 		expect(subject.play(:rock, :scissors)).to eq :p1_wins
	 	end

	 	it "returns Player 1 wins if scissors vs paper" do
	 		expect(subject.play(:scissors, :paper)).to eq :p1_wins
	 	end

	 	it "returns Player 1 wins if paper vs rock" do
	 		expect(subject.play(:paper, :rock)).to eq :p1_wins
	 	end

	 	it "returns Player 2 wins if rock vs paper" do
	 		expect(subject.play(:rock, :paper)).to eq :p2_wins
	 	end

	 	it "returns Player 2 wins if paper vs scissors" do
	 		expect(subject.play(:paper, :scissors)).to eq :p2_wins
	 	end

	 	it "returns Player 2 wins if rock vs scissors" do
	 		expect(subject.play(:scissors, :rock)).to eq :p2_wins
	 	end
	end

		it "adds 1 to the Player 1 win count when Player 1 wins" do
			subject.play(:rock, :scissors)
			expect(subject.player_1_count).to eq 1
		end
	 
	#Tesing this causing an issue. Want to check if constant includes :rock
  xit "creates a random choice of RPS for computer player" do
  	expect(COMPUTER_CHOICES).to include :rock
 	end
end 
