class AddCheckin < ActiveRecord::Migration[5.0]
  def change
  	remove_column :reservations, :dates_booked
  	add_column :reservations, :check_in, :date
  	add_column :reservations, :check_out, :date
  end
end
