class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :appt_time
      t.string :cust_name

      t.timestamps
    end
  end
end
