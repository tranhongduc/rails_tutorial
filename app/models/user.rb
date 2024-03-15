# frozen_string_literal: true

# This class represents a user in the system.
class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: Settings.digit_50 }
  validates :email, presence: true, length: { maximum: Settings.digit_255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness:  true

  after_update :run_callbacks_after_update

  before_save :downcase_email

  has_secure_password
  attr_accessor :remember_token

  # Returns the hash digest of the given string.
  class << self
    def digest(string)
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # remember a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_columns(remember_digest: User.digest(remember_token))
  end

  # Forgets a user.
  def forget
    update_column :remember_digest, nil
  end

  private

  def downcase_email
    email.downcase!
  end
end
