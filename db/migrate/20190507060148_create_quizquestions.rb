class CreateQuizquestions < ActiveRecord::Migration[5.2]
  def change
    create_table :quizquestions do |t|
      t.references :qquiz, foreign_key: true
      t.references :course_question, foreign_key: true

      t.timestamps
    end
  end
end
