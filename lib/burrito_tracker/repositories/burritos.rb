require 'pg'

module BurritoTracker
  module Repositories
    class BurritosRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'burrito-tracker-db')
      end

      def create_tables
        command = <<-SQL
        CREATE TABLE IF NOT EXISTS burritos (id SERIAL PRIMARY KEY, type TEXT);
        SQL
        result = @db.exec(command)
      end

      def drop_tables
        command = <<-SQL
        DROP TABLE burritos;
        SQL
        result = @db.exec(command)
      end

    end
  end
end