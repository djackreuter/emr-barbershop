class RemoveBarbershopIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :barbershop_id, :integer
  end
end
