class Customer < ApplicationRecord
  belongs_to :address

  validates :name, presence: true
end
