class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :japanese_name
      t.string :chinese_name
      t.string :english_name
      t.timestamps
    end
  end
end
