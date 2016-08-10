class AccessPoint
  include Mongoid::Document

  belongs_to :zone
  belongs_to :acquisition_set

  field :BSSID, type: String
  field :RSSI, type: Integer

  field :zone_id, type: String
  field :acquisition_set_id, type: String
end
