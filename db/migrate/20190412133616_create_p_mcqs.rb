class CreatePMcqs < ActiveRecord::Migration[5.2]
  def change
    create_table :p_mcqs do |t|
      t.string :email
      t.references :punjab_cource, foreign_key: true
      t.string :q
      t.string :o1
      t.string :o2

      t.timestamps
    end
  end
end
