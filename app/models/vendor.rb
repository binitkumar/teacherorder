class Vendor < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :order_id, :teacher_name, :items_attributes, :total

  belongs_to :order
  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true,
                                reject_if: :all_blank
end
