Rails.application.routes.draw do
  root 'home#index'
  get 'contact', to: 'single_pages#contact'
  
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create, :destroy]
  end
  
  resources :ingredients, only: [:index] 
  
  resources :users, only: [:show, :edit, :update] do
  resources :avatars, only: [:create]
  resources :menus, only: [:show]
end
  
end


