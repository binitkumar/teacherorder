class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :first_name
      t.string :last_name
      t.string :teacher_name
      t.integer :order_id

      t.timestamps
    end
  end
end
