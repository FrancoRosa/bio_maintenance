class DeviceType < ApplicationRecord
  validates :name, presence: true
  validates :protocol, presence: true
end
