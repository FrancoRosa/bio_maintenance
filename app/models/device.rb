class Device < ApplicationRecord
  belongs_to :area
  belongs_to :device_type
  belongs_to :critical_level
end
