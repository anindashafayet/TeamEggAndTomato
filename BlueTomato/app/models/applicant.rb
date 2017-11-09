class Applicant < ApplicationRecord
  belongs_to :client_request
  belongs_to :account
end
