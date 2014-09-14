#Refer to this class as BurritoTracker::Restaurant
module BurritoTracker
  class Restaurant

    attr_reader :name

    def initialize(params)
      @name = params[:name]
    end


  end
end