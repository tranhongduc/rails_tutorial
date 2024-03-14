# frozen_string_literal: true

# RememberDigest migration creates the "user" table in the database.
# This table will store information about various RememberDigest in the application.
class AddRememberDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :remember_digest, :string
  end
end
