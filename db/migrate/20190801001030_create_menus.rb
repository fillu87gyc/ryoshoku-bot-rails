class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :menu1
      t.string :menu2
      t.date :date
      t.integer :time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
