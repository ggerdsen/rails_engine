class InvoiceItem < ApplicationRecord
  validates_presence_of :csv_id,
                        :item_id,
                        :invoice_id,
                        :quantity,
                        :unit_price,
                        :created_at,
                        :updated_at
  
  belongs_to :item
  belongs_to :invoice
end
