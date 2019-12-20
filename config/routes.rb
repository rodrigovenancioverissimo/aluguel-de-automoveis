Rails.application.routes.draw do
  resources :leases
  resources :licenses
  resources :phones
  resources :people
  resources :settings
  resources :automobiles
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
