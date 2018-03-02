class AddUserIdToBarbershops < ActiveRecord::Migration[5.1]
  def change
    add_column :barbershops, :user_id, :integer
  end
end
