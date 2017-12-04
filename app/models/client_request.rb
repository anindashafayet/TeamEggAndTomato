class ClientRequest < ApplicationRecord
  validates :service_type_id, presence: true
  validates :title, presence: true, length: { minimum: 5 }
  serialize :period_detail, Hash
  has_many :messages, dependent: :destroy
  has_many :applicants, dependent: :destroy
  has_one :user
  belongs_to :service_type

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

	filterrific(
		default_filter_params: { sorted_by: 'created_at_desc' },
		available_filters:[
			:sorted_by,
			:with_name,
			:search_query,
			:with_detail,
			:search_city,
			:has_matched_user

		]
	)
	#filter on 'name' column on service_type table
	scope :with_name, lambda { |c|
		where('service_name = ?', c)
	}

	scope :has_matched_user, lambda { |flag|
		return nil  if 0 == flag # checkbox unchecked
		where(matched_user: nil)
	}

	scope :with_detail, lambda { |d|
		where(detail: [d])
	}

	scope :sorted_by, lambda { |sort_option|
	  # extract the sort direction from the param value.
	  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	  case sort_option.to_s
	  when /^created_at_/
		# Simple sort on the created_at column.
		# Make sure to include the table name to avoid ambiguous column names.
		# Joining on other tables is quite common in Filterrific, and almost
		# every ActiveRecord table has a 'created_at' column.
		order("client_requests.created_at #{ direction }")
	  when /^period/
	    order("client_requests.period #{ direction }")

	  else
		raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	  end
	}

	def self.options_for_sorted_by
		[
		['Name ', 'name_asc']

		]
	end

	def self.options_for_select
		order('LOWER(detail)').map { |e| [e.detail] }
	end

	scope :search_query, lambda { |query|
		# Searches the students table on the 'first_name' and 'last_name' columns.
		# Matches using LIKE, automatically appends '%' to each term.
		# LIKE is case INsensitive with MySQL, however it is case
		# sensitive with PostGreSQL. To make it work in both worlds,
		# we downcase everything.
		return nil  if query.blank?

		# condition query, parse into individual keywords
		terms = query.downcase.split(/\s+/)

		# replace "*" with "%" for wildcard searches,
		# append '%', remove duplicate '%'s
		terms = terms.map { |e|
		(e.gsub('*', '%') + '%').gsub(/%+/, '%')
		}
		# configure number of OR conditions for provision
		# of interpolation arguments. Adjust this if you
		# change the number of OR conditions.
		num_or_conds = 1
		where(
			terms.map { |term|
			  "((client_requests.title) LIKE ?)"
			}.join(' AND '),
			*terms.map { |e| [e] * num_or_conds }.flatten
		)
	}

	scope :search_city, lambda { |query|

		return nil  if query.blank?

		terms = query.downcase.split(/\s+/)
		terms = terms.map { |e|
		(e.gsub('*', '%') + '%').gsub(/%+/, '%')
		}

		num_or_conds = 1
		where(
			terms.map { |term|
			  "((client_requests.city) LIKE ?)"
			}.join(' AND '),
			*terms.map { |e| [e] * num_or_conds }.flatten
		)
	}
end
