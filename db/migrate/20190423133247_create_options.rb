class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :opt
      t.references :question_answer, foreign_key: true

      t.timestamps
    end
  end
end
