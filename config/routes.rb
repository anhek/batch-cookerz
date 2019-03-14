Rails.application.routes.draw do
  get 'menu_recipes/create'
  root 'home#index'
  get 'contact', to: 'single_pages#contact'
  get 'concept', to: 'single_pages#concept'
  get 'team', to: 'single_pages#team'
  
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update] do
    resources :avatars, only: [:create]
    resources :menus, only: [:show]
  end

  resources :ingredients, only: [:index] 
  resources :menu_recipes, only: [:create]
  
end


