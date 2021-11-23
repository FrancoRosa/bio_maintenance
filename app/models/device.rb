class Device < ApplicationRecord
  belongs_to :area
  has_one :facility, through: :area
  belongs_to :device_type
  belongs_to :critical_level
  has_many :maintenances
  validates :name, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :serial, presence: true
  validates :last_maintenance, presence: true
end
