class AddMoreColumnIntoUser < ActiveRecord::Migration[5.0]
  def change
  	 	add_column :users, :gender, :boolean
  	 	add_column		   :users, :phone, :integer
  	 	add_column		   :users, :country, :varchar
  	 	add_column		   :users, :birthday, :date
  end
end
