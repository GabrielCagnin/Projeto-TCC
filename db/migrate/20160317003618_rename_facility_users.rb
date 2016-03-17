class RenameFacilityUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :facility_users, :facilities_users
  end
end
