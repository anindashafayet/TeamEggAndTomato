module Stripe
  class Payout < APIResource
    extend Stripe::APIOperations::List
    extend Stripe::APIOperations::Create
    include Stripe::APIOperations::Save

    OBJECT_NAME = "payout".freeze

    def cancel
      resp, api_key = request(:post, cancel_url)
      initialize_from(resp.data, api_key)
    end

    def cancel_url
      resource_url + "/cancel"
    end
  end
end
