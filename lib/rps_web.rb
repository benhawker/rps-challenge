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
  	erb :gameplay
  end

  post '/gameplay' do
  	@name = params[:name]
    session[:name] = @name
  	@best_of = params[:best_of]

  	erb :gameplay 
  end

  post '/gameplay' do
    @name = session[:name]
  end

  #This is not DRY - not happy with this section.
  get '/rock' do
    @name = session[:name]
  	@computer_choice = $g.computer_choice
  	@result = $g.play(:rock, @computer_choice)

  	redirect '/result' if $g.winner?
  	erb :rock
  end

  get '/paper' do
    @name = session[:name]
    @computer_choice = $g.computer_choice
    @result = $g.play(:paper, @computer_choice)
    @p1_count = 

    redirect '/result' if $g.winner?
    erb :paper
  end

  get '/scissors' do
    @name = session[:name]
  	@computer_choice = $g.computer_choice
  	@result = $g.play(:scissors, @computer_choice)

  	redirect '/result' if $g.winner?
  	erb :scissors
  end

	get '/result' do
    @name = session[:name]

	  erb :result
	end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
