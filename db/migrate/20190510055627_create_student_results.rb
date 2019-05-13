class CreateStudentResults < ActiveRecord::Migration[5.2]
  def change
    create_table :student_results do |t|
      t.references :user, foreign_key: true
      t.references :quizquestion, foreign_key: true
      t.string :ans
      t.integer :max
      t.integer :obtain

      t.timestamps
    end
  end
end
