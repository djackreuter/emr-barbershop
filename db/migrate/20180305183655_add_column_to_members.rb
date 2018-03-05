class AddColumnToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :user_id, :integer
    add_column :members, :barbershop_id, :integer
  end
end
