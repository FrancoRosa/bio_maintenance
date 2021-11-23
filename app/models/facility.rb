class Facility < ApplicationRecord
  has_many :areas
  has_many :devices, through: :areas
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :contact_phone, length: { maximum: 9 }
end
