class TransactionsController < ApplicationController

	def new
	end

	def index
		logger.debug("Info session =================")
		logger.debug(current_user.id)
	end

	def show
	end

	def pay
		@client_request = ClientRequest.find(params[:client_req_id])
		logger.debug(@client_request.title)

		@receive_email = User.find(@client_request.matched_user).email
		logger.debug("Email is ====================================")
		logger.debug(@receive_email)

		@payout = PayPal::SDK::REST::Payout.new(
		  {
		    :sender_batch_header => {
		      :sender_batch_id => SecureRandom.hex(8),
		      :email_subject => 'You have a Payout!',
		    },
		    :items => [
		      {
		        :recipient_type => 'EMAIL',
		        :amount => {
		          :value => @client_request.payment,
		          :currency => 'USD'
		        },
		        :note => 'Thanks for your patronage!',
		        :receiver => @receive_email,#'verybluetomatos-buyer@gmail.com', # replace with @receive_email
		        :sender_item_id => "2014031400023",
		      }
		    ]
		  }
		)
		begin
  			@payout_batch = @payout.create
			logger.debug(@payout_batch.items)
  			logger.info "Created Payout with [#{@payout_batch.batch_header.payout_batch_id}]"
		rescue PayPal::SDK::REST::ResourceNotFound => err
  			logger.error @payout.error.inspect
		end

		logger.debug("!!!!!!!!!!!!!!!!!!!!!!!!!! batch vvvvvv")

		# Get Payout batch Status
		begin
			@payout_batch_x = PayPal::SDK::REST::Payout.get(@payout_batch.batch_header.payout_batch_id)
	  		logger.info "Got Payout Batch Status[#{@payout_batch_x.batch_header.payout_batch_id}]"
		rescue PayPal::SDK::REST::ResourceNotFound => err
			logger.error "Payout Batch not Found"
		end

		logger.debug("!!!!!!!!!!!!!!!!!!!!!!!!!! item vvvvvv")
		logger.debug(@payout_batch_x.items[0].payout_item_id)
		begin
			@payout_item_details= PayPal::SDK::REST::PayoutItem.get(@payout_batch_x.items[0].payout_item_id)
  			logger.info "Got Payout Item Status[#{@payout_item_details.payout_item_id}]"
		rescue PayPal::SDK::REST::ResourceNotFound => err
			logger.error "Payout Item not Found"
		end

		@client_request.received = "true"
		@client_request.save

		redirect_to '/'

	end

	def create
		@client_request = ClientRequest.find(params[:client_req_id])
		@from_user = @client_request.user_id
		@target_user = @client_request.matched_user
		@client_request.payment = params[:cost].to_i
		@client_request.payment_status = "Complete"
		@client_request.save

		@transaction = Transaction.new
		@transaction.from = @from_user
		@transaction.target = @target_user
		@transaction.creq_id = @client_request.id
		@transaction.transaction_amount = params[:cost].to_i
		@transaction.transaction_type = "payment"
		@transaction.transaction_method = "paypal"
		@transaction.status = "Complete"
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
