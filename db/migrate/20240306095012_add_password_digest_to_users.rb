# frozen_string_literal: true

# PasswordDigest migration creates the "PasswordDigest" table in the database.
# This table will store information about various PasswordDigest in the application.
class AddPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string
  end
end
