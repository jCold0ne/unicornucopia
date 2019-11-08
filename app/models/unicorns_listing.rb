class UnicornsListing < ApplicationRecord
  belongs_to :unicorns_user, -> { with_deleted }
  has_one :unicorn, through: :unicorns_user
  has_one :user, through: :unicorns_user
end
