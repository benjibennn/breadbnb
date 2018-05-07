class BraintreeController < ApplicationController
  def new
  	 @client_token = Braintree::ClientToken.generate
  end

  def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
	  current_listing_price = Listing.find(params[:listing_id]).price.to_i
	  reservation = Reservation.last
	  r_start = reservation.check_in
	  r_end = reservation.check_out
	  days = (r_start-r_end).to_i
	  price = days * current_listing_price

	  result = Braintree::Transaction.sale(
	   :amount => price,
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {:submit_for_settlement => true}
	   )


	  if result.success?
	    redirect_to :root, :flash => { :success => "Transaction successful!" }
	  else
	    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	  end
	end

end
