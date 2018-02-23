class CreateBarbershops < ActiveRecord::Migration[5.1]
  def change
    create_table :barbershops do |t|
      t.string :barbershop_name
      t.integer :price

      t.timestamps
    end
  end
end
