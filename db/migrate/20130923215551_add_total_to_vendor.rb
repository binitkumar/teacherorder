class AddTotalToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :total, :integer
  end
end
