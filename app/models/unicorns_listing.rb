class UnicornsListing < ApplicationRecord
  belongs_to :unicorns_user
  has_one :unicorn, through: :unicorns_user
  has_one :user, through: :unicorns_user
end
