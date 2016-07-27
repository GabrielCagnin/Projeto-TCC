class Zone
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :facility

  field :name, type: String
  field :facility_id, type: String
end
