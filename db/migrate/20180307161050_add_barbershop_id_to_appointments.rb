class AddBarbershopIdToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :barbershop_id, :integer
  end
end
