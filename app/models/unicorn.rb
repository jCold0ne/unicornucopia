class Unicorn < ApplicationRecord
    has_one_attached :pic
    has_one :unicorns_user
    has_one :user, through: :unicorns_user
end
