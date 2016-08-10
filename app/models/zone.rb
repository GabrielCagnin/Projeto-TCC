class Zone
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :facility
  has_many :acquisition_sets
  has_many :access_points

  field :name, type: String

  field :facility_id, type: String
end
