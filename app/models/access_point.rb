class AccessPoint
  include Mongoid::Document

  belongs_to :zone
  belongs_to :acquisition

  field :BSSID, type: String
  field :RSSI, type: Integer

  field :zone_id, type: String
  field :acquisition_id, type: String
end
