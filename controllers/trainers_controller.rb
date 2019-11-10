require('sinatra')
require('sinatra/contrib/all')

require('pry-byebug')

require_relative( '../models/trainer.rb' )

also_reload( '../models/*' )
