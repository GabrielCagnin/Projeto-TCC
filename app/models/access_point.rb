class AccessPoint
  include Mongoid::Document

  embedded_in :acquisition

  field :BSSID, type: String
  field :RSSI, type: Integer

  field :zone_id, type: String
  field :acquisition_id, type: String
end
