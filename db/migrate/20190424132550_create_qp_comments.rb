class CreateQpComments < ActiveRecord::Migration[5.2]
  def change
    create_table :qp_comments do |t|
      t.string :comment
      t.boolean :status
      t.references :question_paper, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
