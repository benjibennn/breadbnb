class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, reservation_id)
		@customer = customer
		@host = host
		@reservation_id = reservation_id
		@url = "http://localhost:3000/listings/41"
		mail(to: @customer.email, subject: "Successful!")
	end
end