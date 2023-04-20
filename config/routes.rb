Rails.application.routes.draw do
  get 'pokemons/index'
  get 'pokemons/show'
  get 'pokemons/new'
  get 'pokemons/create'
  get 'pokemons/edit'
  get 'pokemons/update'
  get '/pokemons', to: 'pokemons#index'
  root 'pokemons#index'
  resources :pokemons
  
  namespace :api do
    namespace :v1 do
      # route api/v1/pokemon/25
      get 'pokemon/:name', to: 'poke_api#get_pokemon'
    end
  end

  delete '/pokemons/:id', to: 'pokemons#destroy', as: 'delete_pokemon'
end