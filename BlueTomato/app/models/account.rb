class Account < ApplicationRecord
	belongs_to :accountable, :polymorphic => true
	validates_uniqueness_of :username
	#belongs_to :client
	has_many :messages, dependent: :destroy
	has_many :applicants, dependent: :destroy
end
