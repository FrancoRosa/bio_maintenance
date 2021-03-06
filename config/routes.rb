Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users
  root to: 'admin/dashboard#index'
  get '/new_maintenance_report', to: 'maintenances#new_maintenance', as: 'new_maintenance_report'
  get '/next_maintenances', to: 'devices#next_maintenances', as: 'next_maintenances'
  get '/maintenance_report/:id', to: 'devices#report', as: 'report'
  get '/login', to: 'login#index'
  post '/login', to: 'login#create'
  delete '/login', to: 'login#destroy'
  resources :maintenances
  resources :devices
  resources :maintainers
  resources :critical_levels
  resources :device_types
  resources :areas
  resources :facilities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
