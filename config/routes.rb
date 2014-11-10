Rails.application.routes.draw do
  resources :users
  resources :organizations, controller: 'users', type: 'Organization'
  resources :volunteers, controller: 'users', type: 'Volunteer'
  resources :projects

  get "/" => 'home#index'
  get "/new-session" => "sessions#new"
  post "/create-session" => "sessions#create"
  get "/destroy-session" => "sessions#destroy"
  get "/about" => "home#about"
  get "/signup" => "home#signup"
end
