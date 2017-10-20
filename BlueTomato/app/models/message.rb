class Message < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    validates :email, presence: true
