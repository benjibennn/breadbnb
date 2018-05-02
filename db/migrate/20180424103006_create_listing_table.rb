class CreateListingTable < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_tables do |t|
    	t.string :name, null: false
    	t.integer :place_type
    	t.string :property_type, null: false
    	t.integer :room_number
    	t.integer :bed_number
    	t.integer :guest_number
    	t.string :country, null: false
    	t.string :state, null: false
    	t.string :city, null: false
    	t.integer :zipcode
    	t.string :address, null: false
    	t.integer :price
    	t.string :description
    	t.integer :user_id
        t.json :images
    end
  end
end
