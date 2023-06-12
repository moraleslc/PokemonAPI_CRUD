Rails.application.routes.draw do
  get 'pages/landing'
  get 'pokemons/index'
  get 'pokemons/show'
  get 'pokemons/new'
  get 'pokemons/create'
  get 'pokemons/edit'
  get 'pokemons/update'
  get '/pokemons', to: 'pokemons#index'
  root 'pages#landing'
  

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  post "login", to: "sessions#create"
  get "login", to: "sessions#new"
  delete "logout", to: "sessions#destroy"

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token
  
  resources :articles do
    resources :comments
  end
  namespace :api do
    namespace :v1 do
      # route api/v1/pokemon/25
      get 'pokemon/:name', to: 'poke_api#get_pokemon'
    end
  end

  delete '/pokemons/:id', to: 'pokemons#destroy', as: 'delete_pokemon'
end
