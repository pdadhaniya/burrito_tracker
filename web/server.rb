require_relative '../lib/burrito_tracker.rb'
require 'sinatra/base'

class BurritoTracker::Server < Sinatra::Application
set :bind, '0.0.0.0'

  get '/' do
    "HEY BURRITOS"
  end














end