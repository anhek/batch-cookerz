Rails.application.routes.draw do
  
  devise_for :users
  
  root 'home#index'
  get 'contact', to: 'single_pages#contact'
  get 'concept', to: 'single_pages#concept'
  get 'team', to: 'single_pages#team'
  
 
  resources :ingredients, only: [:index] 
  resources :menu_recipes, only: [:index, :create]

  resources :recipes, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :pictures, only: [:create]
  end
  
  resources :users, only: [:show, :edit, :update] do
    resources :avatars, only: [:create]
    resources :menus, only: [:show]
  end


  
end


