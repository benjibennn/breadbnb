class ReservationJob < ApplicationJob
  queue_as :default

  def perform(customer, host, reservation_id)
  	    p " I am inside of job!"
	 	ReservationMailer.booking_email(customer,host,reservation_id).deliver_now
    # Do something later
  end
end

