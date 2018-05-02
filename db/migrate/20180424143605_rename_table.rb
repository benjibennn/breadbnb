class RenameTable < ActiveRecord::Migration[5.0]
  def change
  	rename_table :listing_tables, :listing
  end
end
