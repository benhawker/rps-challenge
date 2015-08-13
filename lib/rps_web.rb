require 'sinatra/base'
require_relative 'game'

class RPS < Sinatra::Base

	set :views, proc { File.join(root, '..', 'views') }
  set :public, proc { File.join(root, '..', 'public') }
  
  enable :sessions

  get '/' do
    $g = Game.new
    erb :index
  end

  get '/gameplay' do
    @name = session[:name]
    # @best_of = session[:best_of]
  	erb :gameplay
  end

  post '/gameplay' do
  	@name = params[:name]
    session[:name] = @name
  	# @best_of = params[:best_of]
    # session[:best_of] = @best_of
  	erb :gameplay 
  end

  post '/gameplay' do
    @name = session[:name]
    # @best_of = session[:best_of]
  end

  get '/rock' do
    @name = session[:name]
    # @best_of = session[:best_of]
  	@computer_choice = $g.computer_choice
  	@result = $g.play(:rock, @computer_choice)

  	redirect '/result' if $g.winner?
  	erb :rock
  end

  get '/paper' do
    @name = session[:name]
    # @best_of = session[:best_of]
    @computer_choice = $g.computer_choice
    @result = $g.play(:paper, @computer_choice)

    redirect '/result' if $g.winner?
    erb :paper
  end

  get '/scissors' do
    @name = session[:name]
    # @best_of = session[:best_of]
  	@computer_choice = $g.computer_choice
  	@result = $g.play(:scissors, @computer_choice)

  	redirect '/result' if $g.winner?
  	erb :scissors
  end

	get '/result' do
    @name = session[:name]
    # @best_of = session[:best_of]

	  erb :result
	end

  helpers do
    def result
      if @result == :draw 
        "It's a Draw!"
      elsif @result == :p2_wins
        "You lose!"
      else 
        "You win!"
      end
    end
  end 


  # start the server if ruby file executed directly
  run! if app_file == $0
end
