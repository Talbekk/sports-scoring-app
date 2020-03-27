require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('controllers/trainers_controller.rb')
require_relative('controllers/matches_controller.rb')
require_relative('controllers/monsters_controller.rb')
require_relative('models/trainers.rb')
require_relative('models/matches.rb')
require_relative('models/monsters.rb')

# also_reload( './models/*' )

get '/' do
  @trainers1 = Trainer.all()
  @trainers2 = @trainers1.sort_by {|trainer| trainer.points}
  @trainers = @trainers2.reverse
  @match1 = Match.all()
  @match = @match1.last()
  erb( :index )
end

