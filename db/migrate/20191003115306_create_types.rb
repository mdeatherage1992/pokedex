class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :poke_types do |t|
      t.string :english_name
      t.string :chinese_name
      t.string :japanese_name
      t.timestamps
    end
  end
end
