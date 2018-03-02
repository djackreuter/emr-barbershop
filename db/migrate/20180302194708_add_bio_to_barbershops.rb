class AddBioToBarbershops < ActiveRecord::Migration[5.1]
  def change
    add_column :barbershops, :bio, :text
  end
end
