class Facility < ApplicationRecord
  has_many :zones
  has_many :facilities_users
  has_many :users, through: :facilities_users
end
