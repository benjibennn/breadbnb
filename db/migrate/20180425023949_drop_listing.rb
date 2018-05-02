class DropListing < ActiveRecord::Migration[5.0]
  def change
  	  	rename_table :listing, :listings

  end
end
