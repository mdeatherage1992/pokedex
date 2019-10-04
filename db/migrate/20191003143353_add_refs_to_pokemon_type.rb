class AddRefsToPokemonType < ActiveRecord::Migration[5.2]
  def change
    add_reference :pokemon_types, :pokemon, foreign_key: true
    add_reference :pokemon_types, :poke_type, foreign_key: true
  end
end
