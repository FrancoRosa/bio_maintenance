ActiveAdmin.register Device do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :brand, :model, :serial, :last_maintenance, :area_id, :device_type_id, :critical_level_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :brand, :model, :serial, :last_maintenance, :area_id, :device_type_id, :critical_level_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
