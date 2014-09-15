require 'pg'

module BurritoTracker
  module Repositories
    class BurritosRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'burrito-tracker-db')
      end

    end
  end
end