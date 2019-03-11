Rails.application.routes.draw do
  root 'recipes#index'
  
  devise_for :users
  resources :recipes, only: [:index]
  resources :ingredients, only: [:index]

  
=======
  root 'home#index'

  resources :users, only: [:show, :edit]
  get 'contact', to: 'single_pages#contact'
>>>>>>> e7e37ff8db8f7124cb4b934fef666896c0edd39b
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


