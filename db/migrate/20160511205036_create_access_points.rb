class CreateAccessPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :access_points do |t|
      t.string :ssid
      t.macaddr :bssid
      t.integer :rssi
      t.integer :measure_id

      t.timestamps
    end
  end
end
