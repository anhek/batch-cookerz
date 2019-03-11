Rails.application.routes.draw do
  root 'recipes#index'
  
  devise_for :users
  resources :recipes, only: [:index]
  resources :ingredients, only: [:index]

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
