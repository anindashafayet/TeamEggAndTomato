class Profile < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy
  
  VALID_PHONE_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
  
  validates :phone, uniqueness: true, format: { with: VALID_PHONE_REGEX }
  GENDER_TYPES = ["","Male", "Female"]
end
