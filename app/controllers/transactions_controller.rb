class TransactionsController < ApplicationController

	def new
	end

	def create
		@current_user = User.find(params[:id])

		@transaction = Transaction.new
		@transaction.user_id = @current_user
		@transaction.transaction_type = "payment"
		@transaction.transaction_method = "paypal"

		# return url in bracket
      	redirect_to @transaction.paypal_url(transaction_path(@transaction))
      	render :home_address

	end

end
