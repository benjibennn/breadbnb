class ReservationsController < ApplicationController
	# before_action :validate, :only [:create]

	
	def create
	 	reservation = Reservation.new(reservation_params)
	 	reservation.listing_id = params[:listing_id]
	 	reservation.user_id = current_user.id
	 	if reservation.save
	 		ReservationJob.perform_later(current_user,reservation.listing_id,reservation.id)
	 		# ReservationMailer.booking_email(current_user,reservation.listing_id,reservation.id).deliver_now
	 		redirect_to '/'
	 	else
	 		flash[:overlap] = "Dates are already booked!"
	 		redirect_to new_listing_reservation_path(params[:listing_id])
	 	end
	end

	def new
		@reservation = Reservation.new
	end






private
	def reservation_params
      params.require(:reservation).permit(:check_in, :check_out)
    end
end

 