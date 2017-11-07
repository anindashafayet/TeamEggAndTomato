class Message < ApplicationRecord
    validates :text, presence: true, length: { minimum: 5 }
    validates_presence_of :account 
    belongs_to :account
    #validates :email, presence: true
end
