class Customer < ApplicationRecord
  belongs_to :address

  validates :name, presence: true

  before_create :generate_access_token

  scope :by_name, -> (name) { where(name: name) }
  scope :by_street, -> (street) { joins(:address).where("addresses.street = ?", street) }

  private

  # Generate security token
  def generate_access_token
    self.access_token = SecureRandom.hex
  end
end
