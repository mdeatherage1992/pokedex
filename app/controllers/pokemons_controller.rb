class PokemonsController < ApplicationController

def show
  @poke = Pokemon.find(params[:id])
  @types = PokemonType.where(pokemon_id: @poke.id)
  @moves = []
  @types.each do |x|
    r = Move.where(poke_type_id: x.poke_type_id)
    r.each {|y| @moves.push(y)}
  end
end

end
