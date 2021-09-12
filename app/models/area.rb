class Area < ApplicationRecord
  belongs_to :facility
  validates :name, presence: true
  validates :location, presence: true
  validates :contact_phone, length: { maximum: 9 }
end
