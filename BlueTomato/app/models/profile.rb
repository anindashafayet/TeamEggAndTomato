class Profile < ApplicationRecord
	belongs_to :profilable, :polymorphic => true
end
