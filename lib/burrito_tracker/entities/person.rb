#Refer to this class as BurritoTracker::Person
module BurritoTracker
  class Person
    attr_reader :first_name

    def initialize(params)
      @first_name = params[:first_name]
    end

  end
end