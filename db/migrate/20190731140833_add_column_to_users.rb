class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :adminflg, :boolean, default: false, null: false
    add_column :users, :points, :integer
  end
end
