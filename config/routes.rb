Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  root 'home#index'
  get 'contact', to: 'single_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  root 'recipes#index'
  get 'contact', to: 'single_pages#contact'
  
  devise_for :users
  resources :recipes, only: [:index]
  resources :ingredients, only: [:index] 
  
  resources :users, only: [:show, :edit, :update] do
  resources :avatars, only: [:create]
end
  
>>>>>>> 8b62ce67dec556ecab9b786c0f23dda43797917a
end


