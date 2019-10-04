class ChangeType < ActiveRecord::Migration[5.2]
  def change
    remove_column :moves,:type
    add_column :moves,:move_type,:string
  end
end
