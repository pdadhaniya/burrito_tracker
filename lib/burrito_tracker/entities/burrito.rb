#Refer to this class as BurritoTracker::Burrito
module BurritoTracker
  class Burrito

    attr_reader :type

    def initialize(params)
      @type = params[:type]
    end

  end
end