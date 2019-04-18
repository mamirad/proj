class TeacherEmail < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :email, :string
  end
end
