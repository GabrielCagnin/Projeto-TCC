class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.integer :count
      t.integer :zone_id

      t.timestamps
    end
  end
end
