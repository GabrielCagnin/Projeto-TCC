class CreateFacilityUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :facility_users do |t|

      t.timestamps
    end
  end
end
