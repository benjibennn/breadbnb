class AddReference < ActiveRecord::Migration[5.0]
  def change
  	remove_column(:reservations, :listing_id, :integer)
	remove_column(:reservations, :user_id, :integer)
	add_reference :reservations, :listing, foreign_key: true
	add_reference :reservations, :user, foreign_key: true
  end
end
