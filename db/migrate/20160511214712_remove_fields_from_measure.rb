class RemoveFieldsFromMeasure < ActiveRecord::Migration[5.0]
  def change
    remove_column :measures, :ssid, :string
    remove_column :measures, :bssid, :macaddr
    remove_column :measures, :rssi, :integer
  end
end
