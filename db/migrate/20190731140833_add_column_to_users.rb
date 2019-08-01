class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, :null => false, :default => "nanashi"
    add_column :users, :class_name, :string, :null => false, :default => "ようちえん"
    add_column :users, :adminflg, :boolean, :default => false, :null => false
    add_column :users, :points, :integer, :default => 0, :null => false
  end
end
