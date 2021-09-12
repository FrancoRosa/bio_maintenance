class Device < ApplicationRecord
  belongs_to :area
  belongs_to :device_type
  belongs_to :critical_level
  validates :name, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :serial, presence: true
  validates :last_maintenance, presence: true
end
