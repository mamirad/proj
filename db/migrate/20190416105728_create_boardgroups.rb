class CreateBoardgroups < ActiveRecord::Migration[5.2]
  def change
    create_table :boardgroups do |t|
      t.references :group, foreign_key: true
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
