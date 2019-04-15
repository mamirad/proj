class CreatePunjabCourceTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :punjab_cource_teachers do |t|
      t.references :adminteacher, foreign_key: true
      t.references :punjab_cource, foreign_key: true

      t.timestamps
    end
  end
end
