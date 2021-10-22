json.extract! user, :id, :name, :password, :user_type, :maintainer_id, :facility_id, :created_at, :updated_at
json.url user_url(user, format: :json)
