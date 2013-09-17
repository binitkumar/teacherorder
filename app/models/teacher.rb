class Teacher < ActiveRecord::Base
  attr_accessible :teacher_email, :teacher_name
  validates_presence_of :teacher_email, :teacher_name

  has_many :orders
end
