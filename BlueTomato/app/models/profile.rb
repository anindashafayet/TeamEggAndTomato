class Profile < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy

  # validates :gender, inclusion: { in: %w[male female other] }
end
