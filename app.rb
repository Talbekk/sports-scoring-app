require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/trainers_controller.rb')
require_relative('controllers/matches_controller.rb')

get '/' do
  erb( :index )
end
