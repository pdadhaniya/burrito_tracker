#Refer to this class as BurritoTracker::Person
module BurritoTracker
  class Person
    attr_reader :first_name
    attr_accessor :id

    def initialize(params)
      @first_name = params[:first_name]
      @id = id
    end

  end
end