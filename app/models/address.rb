class Address < ApplicationRecord
  has_many :customers

  validates :street, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
end
