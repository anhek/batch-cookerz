Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
<<<<<<< HEAD

  resources :users, only: [:show, :edit]
=======
  get 'contact', to: 'single_pages#contact'
>>>>>>> 1dad38a6d17bf5ae533b9eeaacc37b9fe1e68bc2
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


