class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :english_name
      t.string :japanese_name
      t.string :chinese_name
      t.string :french_name
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :sp_attack
      t.integer :sp_defense
      t.integer :speed
      t.string :image_id
      t.timestamps
    end
  end
end
