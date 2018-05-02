class AddColumnToListing < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :verification, :boolean
  	add_column :users, :role, :integer
  end
end
