require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/trainers_controller.rb')
require_relative('controllers/matches_controller.rb')
require_relative('controllers/monsters_controller.rb')

also_reload( './models/*' )

get '/' do
  @trainers1 = Trainer.all()
  @trainers2 = @trainers1.sort_by {|trainer| trainer.points}
  @trainers = @trainers2.reverse
  erb( :index )
end
