class TeenOffering < ApplicationRecord
  validates :service_type_id, presence: true
  serialize :period_detail, Hash

  def period_detail=(value)
    if RecurringSelect.is_valid_rule?(value) and value != "null"
      super(RecurringSelect.dirty_hash_to_rule(value).to_hash)
    else
      super(nil)
    end
  end

  def rule
    if period_detail.empty?
      nil
    else
      IceCube::Rule.from_hash period_detail
    end
  end
end
