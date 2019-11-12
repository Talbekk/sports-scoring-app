require('sinatra')
require('sinatra/contrib/all')

require('pry-byebug')

require_relative( '../models/trainer.rb')
require_relative ('../models/match.rb')
require_relative('../models/monster.rb')

also_reload('../models/*')

get '/trainers' do
  @trainers1 = Trainer.all()
  @trainers2 = @trainers1.sort_by {|trainer| trainer.points}
  @trainers = @trainers2.reverse
  erb (:"trainers/index")
end

get '/trainers/new' do
  @trainers = Trainer.all()
  @monsters = Monster.all()
  erb (:"trainers/new")
end

post '/trainers' do
  trainer = Trainer.new(params)
  trainer.save()
  redirect to ("/trainers")
end

get '/trainers/:id' do
  @matches = Match.all()
  @monsters = Monster.all()
  @trainer = Trainer.find(params['id'].to_i)
  erb(:"trainers/show")
end

get '/trainers/:id/edit' do
  @matches = Match.all()
  @monsters = Monster.all()
  @trainer = Trainer.find(params['id'].to_i)
  erb(:"trainers/edit")
end

post '/trainers/:id' do
  trainer = Trainer.new(params)
  trainer.update_except_points()
  redirect to "/trainers/#{params['id']}"
end

post '/trainers/:id/delete' do
  trainer = Trainer.find(params['id'].to_i)
  trainer.delete()
  redirect to '/trainers'
end
