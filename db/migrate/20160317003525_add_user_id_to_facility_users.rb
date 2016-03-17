class AddUserIdToFacilityUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :facility_users, :user_id, :integer
  end
end
