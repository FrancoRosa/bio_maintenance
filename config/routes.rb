Rails.application.routes.draw do
  resources :users
  root 'facilities#index'
  get '/new_maintenance_report', to: 'maintenances#new_maintenance', as: 'new_maintenance_report'
  get '/next_maintenances', to: 'devices#next_maintenances', as: 'next_maintenances'
  get '/maintenance_report/:id', to: 'devices#report', as: 'report'
  resources :maintenances
  resources :devices
  resources :maintainers
  resources :critical_levels
  resources :device_types
  resources :areas
  resources :facilities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
