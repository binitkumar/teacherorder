class Order < ActiveRecord::Base
  attr_accessible :item, :quantity, :student_first_name,
                  :student_last_name, :teacher_email,
                  :teacher_name, :total, :teacher_id,:vendors_attributes

  belongs_to :teacher
  has_many :vendors
  accepts_nested_attributes_for :vendors, allow_destroy: true,
                                reject_if: :all_blank
end
