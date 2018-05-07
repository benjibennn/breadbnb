class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  validate :overlapping_dates

def overlapping_dates
  	reservation_array = Reservation.where(listing_id: self.listing_id)
  	check_in = self.check_in
  	check_out = self.check_out

  	if reservation_array
	  	reservation_array.each do |r|
        if r.check_out != nil && r.check_in != nil
  	  		if check_in < r.check_out &&  check_out > r.check_in
  		 		errors.add(:overlap, "no no")
  	  		end
        end
	  	end
	 end  	
  end
end
