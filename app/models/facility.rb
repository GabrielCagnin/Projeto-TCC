class Facility < ApplicationRecord
  has_many :zones
  has_many :facility_users
  has_many :users, through: :facility_users
end
