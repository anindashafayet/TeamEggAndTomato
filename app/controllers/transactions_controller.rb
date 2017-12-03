class TransactionsController < ApplicationController

	def new
	end

	def index

	end

	def show
	end

	def create
		@from_user = params[:details].user_id
		@target_user = params[:details].matched_user


		@transaction = Transaction.new
		@transaction.from = @from_user.id
		@transaction.target = @target_user.id
		@transaction.creq_id = params[:details].id
		@transaction.transaction_type = "payment"
		@transaction.transaction_method = "paypal"
		@transaction.save
		puts "stuff"
		# return url in bracket
      	redirect_to @transaction.paypal_url("/profiles/" + @transaction.from.to_s)

	end

end
