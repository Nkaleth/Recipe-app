Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :new] do
    resources :foods, only: [:index, :show, :create, :new]
  end

  resources :foods, only: [:index]

  # Defines the root path route ("/")
  root "foods#index"

end
