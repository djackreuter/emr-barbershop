class AddBarbershopIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :barbershop_id, :integer
  end
end
