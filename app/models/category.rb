# frozen_string_literal: true

#Category model
class Category < ApplicationRecord
  before_validation { self.name = name.downcase }
  validates :name,
            presence: true,
            allow_blank: false,
            uniqueness: true,
            length: { minimum: 3, maximum: 10}
end
