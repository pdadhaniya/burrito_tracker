require 'pg'

module BurritoTracker
  module Repositories
    class RestaurantsRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'burrito-tracker-db')
      end

      def create_tables
        command = <<-SQL
        CREATE TABLE IF NOT EXISTS restaurants (id SERIAL PRIMARY KEY, name TEXT);
        SQL
        result = @db.exec(command)
      end

      def drop_tables
        command = <<-SQL
        DROP TABLE restaurants;
        SQL
        result = @db.exec(command)
      end

    end
  end
end