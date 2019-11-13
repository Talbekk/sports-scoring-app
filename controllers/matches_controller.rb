require('sinatra')
require('sinatra/contrib/all')

require('pry-byebug')

require_relative( '../models/match.rb' )
require_relative ('../models/trainer.rb')
require_relative('../models/monster.rb')

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
  @trainers = Trainer.all()
  @match = Match.new(params)
  if (@match.get_total_score != 3 || @match.trainer1.first.name == @match.trainer2.first.name)
  redirect to "/matches/new"
  end
  @match.update_table(@trainers, @match)
  @match.save()
  erb(:"matches/create")
end

get '/matches/:id' do
  @trainers = Trainer.all()
  @match = Match.find(params['id'].to_i)
  erb(:"matches/show")
end

get '/matches/:id/edit' do
  @trainers = Trainer.all
  @match = Match.find(params['id'])
  @match.update_table_remove_match(@trainers, @match)
  erb(:"matches/edit")
end

post '/matches/:id' do
  @trainers = Trainer.all()
  @match = Match.new(params)
  if (@match.get_total_score != 3 || @match.trainer1.first.name == @match.trainer2.first.name)
  redirect to "/matches/#{params['id']}/edit"
  end
  @match.update_table(@trainers, @match)
  @match.update()
  redirect to "/matches/#{params['id']}"
end

post '/matches/:id/delete' do
  @trainers = Trainer.all()
  @match = Match.find(params['id'].to_i)
  @match.update_table_remove_match(@trainers, @match)
  @match.delete()
  redirect to '/matches'
end
