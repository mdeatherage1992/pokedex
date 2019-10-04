class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.integer :accuracy
      t.string :type
      t.integer :pp
      t.string :name
      t.string :power
      t.timestamps
    end
  end
end
