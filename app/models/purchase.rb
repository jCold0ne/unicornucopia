class Purchase < ApplicationRecord
  belongs_to :unicorns_listing
  belongs_to :buyer_balance, class_name: "Balance"
  belongs_to :seller_balance, class_name: "Balance"
end
