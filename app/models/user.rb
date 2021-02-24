# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_many :articles
  validates :username,
            presence: true,
            length: { minimum: 3, maximum: 25},
            uniqueness: { case_sensitive: false }
  validates :email_id,
            presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: { case_sensitive: false }
  has_secure_password
end
