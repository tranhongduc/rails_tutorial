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

  private

  def downcase_email
    email.downcase!
  end
end
