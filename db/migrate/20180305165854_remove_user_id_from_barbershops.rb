class RemoveUserIdFromBarbershops < ActiveRecord::Migration[5.1]
  def change
    remove_column :barbershops, :user_id, :integer
  end
end
