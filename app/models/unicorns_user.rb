class UnicornsUser < ApplicationRecord
  acts_as_paranoid
  belongs_to :unicorn
  belongs_to :user
end
