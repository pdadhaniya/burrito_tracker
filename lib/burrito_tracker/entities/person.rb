#Refer to this class as BurritoTracker::Person
module BurritoTracker
  class Person
    attr_accessor :first_name, :id

    def initialize(params)
      @first_name = params[:first_name]
      @id = id
    end

  end
end