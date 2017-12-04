class Transaction < ApplicationRecord

	serialize :notification_params, Hash
	def paypal_url(return_path, transaction)
	logger.debug("INvoice ========================")
	logger.debug(id)
    values = {
        business: "verybluetomatos-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: transaction.transaction_amount,
        item_name: "Teen Service",
        item_number: 1,
        quantity: '1',
		notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

end
