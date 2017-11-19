class Message < ApplicationRecord
    validates :text, presence: true, length: { minimum: 5 }
    validates_presence_of :user
    belongs_to :user
    #validates :email, presence: true
end
