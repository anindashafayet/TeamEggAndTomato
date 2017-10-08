class Teenager < ApplicationRecord
	has_one :account, as: :accountable, dependent: :destroy
	has_one :address, as: :addressable, dependent: :destroy
end