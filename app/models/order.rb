class Order < ApplicationRecord
  belongs_to :cart
  PAYMENT_TYPES = [ "BIDV", "Vietcombank", "VietinBank", "Bank Card" ]
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
end
