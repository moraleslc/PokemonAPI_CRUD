Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # route api/v1/pokemon/25
      get 'pokemon/:name', to: 'poke_api#get_pokemon'
    end
  end
end