# frozen_string_literal: true

# CreateUser migration creates the "user" table in the database.
# This table will store information about various user in the application.
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
