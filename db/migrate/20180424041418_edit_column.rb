class EditColumn < ActiveRecord::Migration[5.0]
  def change
 	remove_column :users, :name, :string
 	add_column :users, :fname, :string

  
  end
end
