class AddFreeAddressToClientRequest < ActiveRecord::Migration[5.1]
    def change
      add_reference :client_requests, :free_address, foreign_key: true
    end
end
