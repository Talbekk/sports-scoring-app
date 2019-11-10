require('sinatra')
require('sinatra/contrib/all')

require('pry-byebug')

require_relative( '../models/match.rb' )

also_reload( '../models/*' )

get '/matches' do
  @matches = Match.all()
  erb ( :"matches/index" )
end

get '/matches/:id' do
  @matches = Match.find(params['id'].to_i)
  erb( :"matches/show" )
end
