Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :leases
  resources :licenses
  resources :phones
  resources :people
  resources :settings
  resources :automobiles
  namespace :reports do
    get :financial
    get :customers
    get :automobiles
  end
  namespace :operational do
    get :new_leases
    get :entry_and_exit_of_leases
    get :late_leases
  end
end
