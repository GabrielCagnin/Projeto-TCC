class EnqueuedClassificationRequest
  include Mongoid::Document

  embeds_many :access_points
  belongs_to :facility

  accepts_nested_attributes_for :access_points

  field :facility_id, type: String
end
