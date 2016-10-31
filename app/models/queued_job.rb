class QueuedJob
  include Mongoid::Document

  embeds_many :access_points

  field :facility_id, type: String
  field :op_type, type: String
  field :response, type: String
end
