require('sinatra')
require('sinatra/contrib/all')

require('pry-byebug')

require_relative( '../models/match.rb' )
require_relative ('../models/trainer.rb')

also_reload( '../models/*' )

get '/matches' do
  @matches = Match.all()
  erb(:"matches/index")
end

get '/matches/new' do
  @trainers = Trainer.all()
  erb(:"matches/new")
end

post '/matches' do
  match = Match.new(params)
  match.save
  redirect to '/matches'
end

get '/matches/:id' do
  @matches = Match.find(params['id'].to_i)
  erb(:"matches/show")
end
#
# get '/matches' do
#   @match = Match.new(params)
#   @match.save
#   erb(:"/matches/create")
# end
#
# get '/matches/:id/edit' do
#   @trainers = Trainer.all
#   @match = Match.find(params['id'])
# end
#
# post '/matches/:id' do
#   match = Match.new(params)
#   match.update
#   redirect to '/matches/#{params[id]}'
# end
#
# post '/matches/:id/delete' do
#   match = Match.find(params[:id])
#   match.delete()
#   redirect to '/matches'
# end
