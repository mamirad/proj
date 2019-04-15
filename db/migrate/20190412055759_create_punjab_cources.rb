class CreatePunjabCources < ActiveRecord::Migration[5.2]
  def change
    create_table :punjab_cources do |t|
      t.string :cource_name
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
