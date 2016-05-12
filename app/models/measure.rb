class Measure < ApplicationRecord
  belongs_to :point
  has_many :access_points
end
