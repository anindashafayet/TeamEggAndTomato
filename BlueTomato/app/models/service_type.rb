class ServiceType < ApplicationRecord
	validates :name, uniqueness:true
	validates :description, uniqueness:true

end
