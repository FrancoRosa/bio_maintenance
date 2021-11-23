class Area < ApplicationRecord
  belongs_to :facility
  has_many :devices
  validates :name, presence: true
  validates :location, presence: true
  validates :contact_phone, length: { maximum: 9 }
end
