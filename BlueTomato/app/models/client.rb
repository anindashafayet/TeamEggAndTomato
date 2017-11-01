class Client < ApplicationRecord
	has_one :account, as: :accountable, dependent: :destroy
	has_one :address, as: :addressable, dependent: :destroy
	
	validate do |client|
		client.account do |account|
		  next if account.valid?
		  account.errors.full_messages.each do |msg|
			# you can customize the error message here:
			errors.add_to_base("account Error: #{msg}")
		  end
		end
	
	end
end
