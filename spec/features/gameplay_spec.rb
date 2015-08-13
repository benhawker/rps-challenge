require 'spec_helper'

feature "Starting a new game" do
  scenario "I  enter my name, click Play & am taken to new game" do
    visit "/"
    fill_in "name_field", with: "Bob"
    select "3", :from => "best_of"
    click_on "submit_btn"
    expect(page).to have_content "Choose Rock, Paper or Scissors, Bob!"
  end

  # #Currently not using this functionality
  # xscenario "User can choose Best of games number" do
  # 	visit "/"
  # 	fill_in "name_field", with: "Bob"
  #   select "5", :from => "best_of"
  #   click_on "submit_btn"
  #   expect(@best_of).to eq "5" 
  # end
end

# should also be testing Paper and Scissors - r is a bad id.
feature "User makes a RPS selection" do
	scenario "I choose Rock and am shown the result" do
    visit "/"
		visit "/gameplay"
		click_link "rock"
		expect(page).to have_content "You selected Rock"
	end

  scenario "I choose Paper and am shown the result" do
    visit "/"
    visit "/gameplay"
    click_link "paper"
    expect(page).to have_content "You selected Paper"
  end

  scenario "I choose Scissors and am shown the result" do
    visit "/"
    visit "/gameplay"
    click_link "scissors"
    expect(page).to have_content "You selected Scissors"
  end

	scenario "Player is shown they are the winner or loser overall (& the computer choice)" do
		visit "/"
    fill_in "name_field", with: "Bob"
    select "3", :from => "best_of"
    click_on "submit_btn"
		visit "/gameplay"
		click_link "rock"
		expect(page).to have_content "Hi"
	end

	scenario "User can go back to play again" do
		visit "/"
    fill_in "name_field", with: "Bob"
    select "3", :from => "best_of"
    click_on "submit_btn"
		click_link "rock"
		click_link "play_again"
		expect(page).to have_content "Choose Rock, Paper or Scissors"
	end

end




