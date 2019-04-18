class CreateTeachercourses < ActiveRecord::Migration[5.2]
  def change
    create_table :teachercourses do |t|
      t.references :course, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
