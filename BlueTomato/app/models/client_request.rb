class ClientRequest < ApplicationRecord
  validates :service_type_id, presence: true
  serialize :period_detail, Hash

  # The model serialize input period_detail with the hash method from RecurringSelect
  def period_detail=(value)
    if RecurringSelect.is_valid_rule?(value) and value != "null"
      super(RecurringSelect.dirty_hash_to_rule(value).to_hash)
    else
      super(nil)
    end
  end

  # Extract the IceCube rule from serialize persistent period_detail
  def rule
    if period_detail.empty?
      nil
    else
      IceCube::Rule.from_hash period_detail
    end
  end
end
