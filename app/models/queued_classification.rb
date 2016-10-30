class QueuedClassification
  include Mongoid::Document

  embeds_many :access_points

  field :facility_id, type: String
end
