#Refer to this class as BurritoTracker::Burrito
module BurritoTracker
  class Burrito
    attr_accessor :type, :id

    def initialize(params)
      @type = params[:type]
      @id = id
    end

  end
end