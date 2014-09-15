require 'pg'

module BurritoTracker
  module Repositories
    class PersonsRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'burrito-tracker-db')
      end

      def save_person(person)
        if person.id.nil?
          command = <<-SQL
          INSERT INTO persons ( first_name )
          VALUES ( '#{person.first_name}' )
          RETURNING *;
          SQL
          result = @db.exec(command).first
          person.instance_variable_set("@id", (result["id"].to_i))
          result
        else
          command = <<-SQL
          UPDATE persons SET ( first_name ) = ( '#{person.first_name}' )
          WHERE id='#{person.id}'
          RETURNING *;
          SQL
          result = @db.exec(command).first
        end
      end

      def delete_person(person)
        command = <<-SQL
        DELETE FROM persons WHERE id='#{person.id}';
        SQL
        result = @db.exec(command)
      end

      def get_person(id)
        command = <<-SQL
        SELECT * FROM persons WHERE id='#{id}';
        SQL
        result = @db.exec(command).first
      end

      def get_all_persons
        command = <<-SQL
        SELECT * FROM persons;
        SQL
        result = @db.exec(command).entries
      end

      def create_tables
        command = <<-SQL
        CREATE TABLE IF NOT EXISTS persons (id SERIAL PRIMARY KEY, first_name TEXT);
        SQL
        result = @db.exec(command)
      end

      def drop_tables
        command = <<-SQL
        DROP TABLE persons;
        SQL
        result =@db.exec(command)
      end

    end
  end
end