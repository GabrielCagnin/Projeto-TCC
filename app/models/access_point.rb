class AccessPoint
  include Mongoid::Document
  field :BSSID, type: String
  field :RSSI, type: Integer
end
