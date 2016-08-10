class AcquisitionSet
  include Mongoid::Document
  field :normalization_algorithm, type: String
  field :time_interval, type: Float
  field :measures_per_point, type: Integer
end
