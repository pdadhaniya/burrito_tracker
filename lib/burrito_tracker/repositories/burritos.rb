require 'pg'

module BurritoTracker
  module Repositories
    class BurritosRepo

      def initialize
        @db = PG.connect(host: 'localhost', dbname: 'burrito-tracker-db')
      end

      def save_burrito(burrito)
        if burrito.id.nil?
          command = <<-SQL
          INSERT INTO burritos ( type )
          VALUES ( '#{burrito.type}' )
          RETURNING *;
          SQL
          result = @db.exec(command).first
          burrito.instance_variable_set("@id", (result["id"].to_i))
          result
        else
          command = <<-SQL
          UPDATE burritos SET ( type ) = ( '#{burrito.type}' )
          WHERE id='#{burrito.id}'
          RETURNING *;
          SQL
          result = @db.exec(command).first
        end
      end

      def delete_burrito(burrito)
        command = <<-SQL
        DELETE FROM burritos WHERE id='#{burrito.id}';
        SQL
        result = @db.exec(command)
      end

      def get_burrito(id)
        command = <<-SQL
        SELECT * FROM burritos WHERE id='#{id}';
        SQL
        result = @db.exec(command).first
      end

      def get_all_burritos
        command = <<-SQL
        SELECT * FROM burritos;
        SQL
        result = @db.exec(command).entries
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