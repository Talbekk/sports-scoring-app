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
  monsters = Monster.all()
  new_monster = Monster.new(params)
  for monster in monsters
    if (monster.name == new_monster.name )
      redirect to "/monsters/new"
    end
  end
  monster.save()
  redirect to ("/monsters")
end

get '/monsters/:id' do
  @trainers = Trainer.all()
  @monster = Monster.find(params['id'].to_i)
  erb(:"monsters/show")
end

get '/monsters/:id/edit' do
  @trainers = Trainer.all
  @monster = Monster.find(params['id'].to_i)
  erb(:"monsters/edit")
end

post '/monsters/:id' do
  monsters = Monster.all()
  new_monster = Monster.new(params)
  for monster in monsters
    if (monster.name == new_monster.name )
      redirect to "/monsters/#{params['id']}/edit"
    end
  end
  monster.update()
  redirect to "/monsters/#{params['id']}"
end

post '/monsters/:id/delete' do
  monster = Monster.find(params['id'].to_i)
  monster.delete()
  redirect to '/monsters'
end
