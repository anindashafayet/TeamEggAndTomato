class Address < ApplicationRecord
  validates :city, presence: true
  validates :zip, presence: true, length: {is:6}, format:{with:/[a-zA-Z][0-9][a-zA-Z][0-9][a-zA-Z][0-9]/}
  before_save :downcase_zip

  belongs_to :profile

  def downcase_zip
    self.city = self.city.titleize
    self.zip.upcase!
  end
end
