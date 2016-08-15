class AccessPoint
  include Mongoid::Document

  embedded_in :acquisition

  field :BSSID, type: String
  field :RSSI, type: Integer

end
