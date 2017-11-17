
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :fname, presence: true
  validates :lname, presence: true

  has_one :profile, dependent: :destroy
end