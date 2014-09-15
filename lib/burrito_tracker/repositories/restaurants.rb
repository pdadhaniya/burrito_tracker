require 'pg'

module BurritoTracker
  module Repositories
    class RestaurantsRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'burrito-tracker-db')
      end

      def save_restaurant(restaurant)
        if restaurant.id.nil?
          command = <<-SQL
          INSERT INTO restaurants ( name )
          VALUES ( '#{restaurant.name}' )
          RETURNING *;
          SQL
          result = @db.exec(command).first
          restaurant.instance_variable_set("@id", (result["id"].to_i))
          result
        else
          command = <<-SQL
          UPDATE restaurants SET ( name ) = ( '#{restaurant.name}' )
          WHERE id='#{restaurant.id}'
          RETURNING *;
          SQL
          result = @db.exec(command).first
        end
      end

      def delete_restaurant(restaurant)
        command = <<-SQL
        DELETE FROM restaurants WHERE id='#{restaurant.id}';
        SQL
        result = @db.exec(command)
      end

      def get_restaurant(id)
        command = <<-SQL
        SELECT * FROM restaurants WHERE id='#{id}';
        SQL
        result = @db.exec(command).first
      end

      def get_all_restaurants
        command = <<-SQL
        SELECT * FROM restaurants;
        SQL
        result = @db.exec(command).entries
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