class Customer < ApplicationRecord
  validates_presence_of :csv_id,
                        :first_name,
                        :last_name,
                        :created_at,
                        :updated_at
  
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices
end
