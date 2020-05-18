Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Create the home and about routes
  root 'pages#home'
  get 'about', to: 'pages#about'
  # create only the "show" route
  resources :articles, only: [:show, :index, :new, :create, :edit, :update]
end
