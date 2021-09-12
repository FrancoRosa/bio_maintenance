class Maintenance < ApplicationRecord
  belongs_to :device
  belongs_to :maintainer

  validates :observations, presence: true
  validates :maintenance_type, presence: true
end
