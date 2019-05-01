class CreateQuestionPapers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_papers do |t|
      t.string :name
      t.references :teachercourse, foreign_key: true

      t.timestamps
    end
  end
end
