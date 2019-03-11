Rails.application.routes.draw do
  root 'recipes#index'
  get 'contact', to: 'single_pages#contact'
  
  devise_for :users
  resources :recipes, only: [:index]
  resources :ingredients, only: [:index] 
  
  resources :users, only: [:show, :edit] do
  resources :avatars, only: [:create]
end
  
end


