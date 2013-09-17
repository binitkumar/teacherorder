class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.integer :total
      t.integer :vendor_id

      t.timestamps
    end
  end
end
