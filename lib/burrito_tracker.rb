require 'pg'

module BurritoTracker

  # def self.persons_repo=(z)
  #   @persons_repo = z
  # end

  # def self.persons_repo
  #   @persons_repo
  # end

  # def self.burritos_repo=(y)
  #   @burritos_repo = y
  # end

  # def self.burritos_repo
  #   @burritos_repo
  # end

  # def self.restaurants_repo=(x)
  #   @restaurants_repo = x
  # end

  # def self.restaurants_repo
  #   @restaurants_repo
  # end

  # def self.persons_burritos_restaurants=(w)
  #   @persons_burritos_restaurants = w
  # end

  # def self.persons_burritos_restaurants
  #   @persons_burritos_restaurants
  # end

end


require_relative 'burrito_tracker/entities/person.rb'
require_relative 'burrito_tracker/entities/burrito.rb'
require_relative 'burrito_tracker/entities/restaurant.rb'
# require_relative 'burrito_tracker/repositories/persons.rb'
# require_relative 'burrito_tracker/repositories/burritos.rb'
# require_relative 'burrito_tracker/repositories/restaurants.rb'
# require_relative 'burrito_tracker/repositories/persons_burritos_restaurants.rb'

# BurritoTracker.persons_repo = BurritoTracker::Repositories::PersonsRepo.new
# BurritoTracker.burritos_repo = BurritoTracker::Repositories::BurritosRepo.new
# BurritoTracker.restaurants_repo = BurritoTracker::Repositories::Restaurants.new
# BurritoTracker.persons_burritos_restaurants = BurritoTracker::Repositories::PersonsBurritosRestaurants.new
