Rails.application.routes.draw do
 
  resources :departments
  devise_for :users
  resources :users
  resources :posts
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
