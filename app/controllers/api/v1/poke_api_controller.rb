require 'poke-api-v2'

class Api::V1::PokeApiController < ApplicationController
def get_pokemon
    pokemon_name = params[:name]
    response = PokeApi.get(pokemon: pokemon_name ).name
  
    if response.nil?
      render json: { error: "Pokemon not found" }, status: :not_found
    else
      render json: response
    end
  end
end
