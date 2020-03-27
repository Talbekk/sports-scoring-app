require('sinatra')
require('sinatra/contrib/all')

# require('pry-byebug')

require_relative( '../models/trainer.rb')
require_relative ('../models/match.rb')
require_relative('../models/monster.rb')

also_reload('../models/*')

get '/trainers' do
  @trainers = Trainer.all()
  erb (:"trainers/index")
end

get '/trainers/new' do
  @trainers = Trainer.all()
  @monsters = Monster.all()
  erb (:"trainers/new")
end

post '/trainers' do
  trainers = Trainer.all()
  new_trainer = Trainer.new(params)
  for trainer in trainers
    if (trainer.name == new_trainer.name)
    redirect to "/trainers/new"
  end
end
  if ( (new_trainer.monster1.first.name != new_trainer.monster2.first.name && new_trainer.monster3.first.name) || (new_trainer.monster2.first.name != new_trainer.monster1.first.name && new_trainer.monster3.first.name) && (new_trainer.monster3.first.name != new_trainer.monster2.first.name || new_trainer.monster1.first.name))
  new_trainer.save()
  redirect to ("/trainers")
else
  redirect to "/trainers/new"
end
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
  trainers = Trainer.all()
  new_trainer = Trainer.new(params)
  if ( (new_trainer.monster1.first.name != new_trainer.monster2.first.name && new_trainer.monster3.first.name) || (new_trainer.monster2.first.name != new_trainer.monster1.first.name && new_trainer.monster3.first.name) && (new_trainer.monster3.first.name != new_trainer.monster2.first.name || new_trainer.monster1.first.name))
    new_trainer.update_except_points()
    redirect to "/trainers/#{params['id']}"
  else
    redirect to "/trainers/#{params['id']}/edit"
  end
end

post '/trainers/:id/delete' do
  trainer = Trainer.find(params['id'].to_i)
  trainer.delete_matches(trainer)
  trainer.delete()
  redirect to '/trainers'
end
