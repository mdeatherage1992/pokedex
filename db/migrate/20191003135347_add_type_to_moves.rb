class AddTypeToMoves < ActiveRecord::Migration[5.2]
  def change
    add_reference :moves, :poke_type, foreign_key: true
  end
end
