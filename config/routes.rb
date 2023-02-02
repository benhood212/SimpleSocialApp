Rails.application.routes.draw do
  get '/profile/:id', to: 'profiles#show', as: 'profile'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :posts do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
