class TransactionsController < ApplicationController

	def new
	end

	def index

	end

	def show
	end

	def create
		@client_request = ClientRequest.find(params[:client_req_id])
		@from_user = @client_request.user_id
		@target_user = @client_request.matched_user
		@client_request.payment = params[:cost].to_i
		@client_request.save

		@transaction = Transaction.new
		@transaction.from = @from_user
		@transaction.target = @target_user
		@transaction.creq_id = @client_request.id
		@transaction.transaction_amount = params[:cost].to_i
		@transaction.transaction_type = "payment"
		@transaction.transaction_method = "paypal"
		@transaction.save

		# return url in bracket
      	redirect_to @transaction.paypal_url("/profiles/" + @transaction.from.to_s, @transaction)

	end
	
	  def hook
	    params.permit! # Permit all Paypal input params
	    status = params[:payment_status]
	    if status == "Completed"
	      @registration = Registration.find params[:invoice]
	      @registration.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
	    end
	    render nothing: true
	  end

end
