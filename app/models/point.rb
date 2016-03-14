class Point < ApplicationRecord
  belongs_to :zone
  has_many :measures
end
