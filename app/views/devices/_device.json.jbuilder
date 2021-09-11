json.extract! device, :id, :name, :brand, :model, :serial, :last_maintenance, :area_id, :device_type_id, :critical_level_id, :created_at, :updated_at
json.url device_url(device, format: :json)
