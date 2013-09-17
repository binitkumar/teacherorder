class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :teacher_name
      t.string :teacher_email
      t.string :student_first_name
      t.string :student_last_name
      t.string :item
      t.decimal :quantity
      t.decimal :total

      t.timestamps
    end
  end
end
