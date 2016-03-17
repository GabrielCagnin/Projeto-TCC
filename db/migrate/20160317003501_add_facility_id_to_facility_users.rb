class AddFacilityIdToFacilityUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :facility_users, :facility_id, :integer
  end
end
