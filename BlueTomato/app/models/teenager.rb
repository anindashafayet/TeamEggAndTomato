class Teenager < ApplicationRecord
	has_one :account, as: :accountable, dependent: :destroy
	has_one :address, as: :addressable, dependent: :destroy
	accepts_nested_attributes_for :address
	accepts_nested_attributes_for :account
end
