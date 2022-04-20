class Maintenance < ApplicationRecord
  belongs_to :device
  belongs_to :maintainer

  validates :observations, presence: true
  validates :maintenance_type, presence: true

  after_save :update_device

  def update_device
    device = Device.find(device_id)
    maintenance = device.maintenances.last
    if maintenance.maintenance_type == 'Preventivo'
      device.update(last_maintenance: created_at)
      puts '... last maintenance updated'
    else
      puts '... last maintenance not updated'
    end
  end
end
