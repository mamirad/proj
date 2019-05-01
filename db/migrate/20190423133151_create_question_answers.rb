class CreateQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answers do |t|
      t.references :question_paper, foreign_key: true
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
