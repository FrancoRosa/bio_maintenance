Rails.application.routes.draw do
  root 'facilities#index'
  resources :maintenances
  resources :devices
  resources :maintainers
  resources :critical_levels
  resources :device_types
  resources :areas
  resources :facilities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
