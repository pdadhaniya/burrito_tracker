#Refer to this class as BurritoTracker::Person
module BurritoTracker
  class Person
    attr_reader :name

    def initialize(params)
      @name = params[:name]
    end

  end
end