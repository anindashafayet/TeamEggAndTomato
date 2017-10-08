class Teenager < ApplicationRecord
	has_one :account, dependent: :destroy
end
