
require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :fname, presence: true
  validates :lname, presence: true
  before_save :downcase_zip

  has_one :profile, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :applicants, dependent: :destroy
  has_many :client_requests, dependent: :destroy

  def downcase_zip
    self.city = self.city.titleize
  end

  def has_profile?
    !profile.nil?
  end

  def has_address?
    has_profile? && !profile.address.nil?
  end

  def has_teenager_requirements?
    has_profile? && age(profile.date_of_birth).between?(13, 19)
  end

  def has_client_requirements?
    has_profile? && has_address? && age(profile.date_of_birth) >= 18
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private

  def age(date_of_birth)
    Date.today.year - date_of_birth.year
  end
end
