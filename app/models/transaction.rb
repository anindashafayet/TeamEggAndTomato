class Transaction < ApplicationRecord

	def paypal_url(return_path)
    values = {
        business: "verybluetomatos-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: '100',
        item_name: "Teen Service",
        item_number: 1,
        quantity: '1'
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

end
