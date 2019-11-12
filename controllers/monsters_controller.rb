require('sinatra')
require('sinatra/contrib/all')

require('pry-byebug')

require_relative( '../models/match.rb' )
require_relative ('../models/trainer.rb')
require_relative('../models/monster.rb')

also_reload( '../models/*' )

get '/monsters' do
  @monsters = Monster.all()
  erb(:"monsters/index")
end

get '/monsters/new' do
  @monsters = Monster.all()
  erb(:"monsters/new")
end

post '/monsters' do
  monster = Monster.new(params)
  monster.save()
  redirect to ("/monsters")
end

get '/monsters/:id' do
  @trainers = Trainer.all()
  @monster = Monster.find(params['id'].to_i)
  erb(:"monsters/show")
end

get '/matches/:id/edit' do
  @trainers = Trainer.all
  @monster = Monster.find(params['id'])
  erb(:"monsters/edit")
end

post '/matches/:id' do
  monster = Monster.new(params)
  monster.update()
  redirect to "/monsters/#{params['id']}"
end

post '/monsters/:id/delete' do
  monster = Monster.find(params['id'].to_i)
  monster.delete()
  redirect to '/monsters'
end
