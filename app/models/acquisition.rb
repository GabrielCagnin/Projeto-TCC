class Acquisition
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :acquisition_set
  belongs_to :zone
  has_many :access_points

  accepts_nested_attributes_for :access_points

  field :acquisition_set_id, type: String
  field :zone_id, type: String
end
