class CreateQuestionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :question_comments do |t|
      t.string :comment
      t.boolean :status
      t.references :course_question, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
