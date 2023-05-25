Rails.application.routes.draw do
  get 'pokemons/index'
  get 'pokemons/show'
  get 'pokemons/new'
  get 'pokemons/create'
  get 'pokemons/edit'
  get 'pokemons/update'
  get '/pokemons', to: 'pokemons#index'
  root 'static_pages#home'

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  post "login", to: "sessions#destroy"
  get "login", to: "sessions#new"
  delete "logout", to: "sessions#destroy"

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  
  namespace :api do
    namespace :v1 do
      # route api/v1/pokemon/25
      get 'pokemon/:name', to: 'poke_api#get_pokemon'
    end
  end

  delete '/pokemons/:id', to: 'pokemons#destroy', as: 'delete_pokemon'
end
