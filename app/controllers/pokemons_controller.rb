require 'poke-api-v2'

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def new
    @pokemon = Pokemon.new
    @types = fetch_pokemon_types
  end

  # CREATE
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      redirect_to pokemons_path
    else
      @types = fetch_pokemon_types
      render :new
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
    @types = fetch_pokemon_types
  end

  def update
    @pokemon = Pokemon.find(params[:id])

    if @pokemon.update(pokemon_params)
      redirect_to @pokemon
    else
      @types = fetch_pokemon_types
      render :edit
    end
  end 

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    redirect_to pokemons_path, notice: 'Pokemon was successfully deleted.'
    
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type, :level)
  end

  def fetch_pokemon_types
    types = PokeApi.get(:type).results
    types.map { |type| [type.name.capitalize, type.name] }
  end
end
