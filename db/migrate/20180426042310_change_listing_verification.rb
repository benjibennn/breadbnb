class ChangeListingVerification < ActiveRecord::Migration[5.0]
  def change
  	remove_column :listings, :verification
  	add_column :listings, :verification, :integer
  end
end
