Rails.application.routes.draw do
  resources :categories

  root to: "splash#index"

  devise_scope :user do
    get '/users/logout', to: 'devise/sessions#destroy', as: :logout
  end
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
