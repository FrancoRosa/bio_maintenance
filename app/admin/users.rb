ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  form do |f|
    f.inputs 'Users' do
      f.input :name, label: 'User name'
      f.input :password, label: 'User password', as: :string
      f.input :user_type, as: :select, collection: %w[client maintainer]
      f.input :facility_id, as: :select, collection: Facility.all
      f.input :maintainer_id, as: :select, collection: Maintainer.all
    end
    f.actions
  end

  permit_params :name, :password, :user_type, :maintainer_id, :facility_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :password, :user_type, :maintainer_id, :facility_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
