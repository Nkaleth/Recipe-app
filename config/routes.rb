Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :new] do
    resources :foods, only: [:index, :show, :create, :new, :destroy]
  end
  resources :recipes, only: [:index, :show, :create, :new, :destroy] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :recipes

  resources :foods, only: [:index]

  get 'general_shopping_list', to: 'pages#general_shopping_list'
  get 'public_recipes', to: 'pages#public_recipes'
  # Defines the root path route ("/")
  root "foods#index"

end
