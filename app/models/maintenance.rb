class Maintenance < ApplicationRecord
  belongs_to :device
  belongs_to :maintainer

  validates :observations, presence: true
  validates :maintenance_type, presence: true

  after_save :update_device

  def update_device
    device = Device.find(device_id)
    device.update(last_maintenance: created_at)
  end
end
