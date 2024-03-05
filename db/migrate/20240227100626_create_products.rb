# frozen_string_literal: true

# CreateProducts migration creates the "products" table in the database.
# This table will store information about various products in the application.
class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name

      t.timestamps
    end
  end
end
