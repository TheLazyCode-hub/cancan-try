Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root "posts#index"
  resources :dashboard
  post '/dashboard/verify/:id', to: 'dashboard#verify', as: 'verify_post'
  post '/dashboard/authorize/:id', to: 'dashboard#authorize', as: 'authorize_post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
