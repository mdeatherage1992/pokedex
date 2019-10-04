class AddNamesToMoves < ActiveRecord::Migration[5.2]
  def change
    add_column :moves, :cname, :string
    add_column :moves, :category, :string
    add_column :moves, :jname, :string
  end
end
