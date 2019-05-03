class CreateCourseQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :course_questions do |t|
      t.string :question
      t.string :answer
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :option5
      t.string :questiontype
      t.references :teachercourse, foreign_key: true

      t.timestamps
    end
  end
end
