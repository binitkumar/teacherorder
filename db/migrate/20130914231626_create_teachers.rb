class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :teacher_name
      t.string :teacher_email

      t.timestamps
    end
  end
end
