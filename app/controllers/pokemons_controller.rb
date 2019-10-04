class PokemonsController < ApplicationController

def show
  @poke = Pokemon.find(params[:id])
end

end
