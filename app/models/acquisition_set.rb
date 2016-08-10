class AcquisitionSet
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :zone
  has_many :access_points

  field :normalization_algorithm, type: String
  field :time_interval, type: Float
  field :measures_per_point, type: Integer

  field :zone_id, type: String
end
