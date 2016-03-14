class Zone < ApplicationRecord
  belongs_to :facility
  has_many :points
end
