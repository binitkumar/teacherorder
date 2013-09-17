class Item < ActiveRecord::Base
  attr_accessible :name, :quantity, :total, :vendor_id

  belongs_to :vendor
end
