class Facility < ApplicationRecord
  has_many :zones
  has_many :facilities_users
  has_many :users, through: :facilities_users
  accepts_nested_attributes_for :facilities_users
end
