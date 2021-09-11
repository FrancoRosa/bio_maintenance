json.extract! maintenance, :id, :observations, :parts, :state_before, :state_after, :maintenance_type, :diagnostic, :activities, :device_id, :maintainer_id, :created_at, :updated_at
json.url maintenance_url(maintenance, format: :json)
