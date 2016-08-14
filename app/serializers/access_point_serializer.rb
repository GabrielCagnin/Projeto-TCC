class AccessPointSerializer < ActiveModel::Serializer
  attributes :id, :BSSID, :RSSI
end
