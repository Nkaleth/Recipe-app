Rails.application.routes.draw do
  get 'public_recipes/index'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :new] do
    resources :foods, only: [:index, :show, :create, :new, :destroy]
  end
  resources :recipes, only: [:index, :show, :create, :new, :destroy] do
    resources :recipe_foods,  as: 'foods'
  end
  resources :recipes

  resources :foods, only: [:index]
  resources :public_recipes, only: [:index]

  get 'general_shopping_list', to: 'pages#general_shopping_list'
  # Defines the root path route ("/")
  root "foods#index"

end
