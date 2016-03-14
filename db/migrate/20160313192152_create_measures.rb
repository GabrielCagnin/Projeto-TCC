class CreateMeasures < ActiveRecord::Migration[5.0]
  def change
    create_table :measures do |t|
      t.string :ssid
      t.macaddr :bssid
      t.integer :rssi
      t.integer :point_id

      t.timestamps
    end
  end
end
