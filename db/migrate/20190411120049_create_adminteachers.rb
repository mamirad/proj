class CreateAdminteachers < ActiveRecord::Migration[5.2]
  def change
    create_table :adminteachers do |t|
      t.string :teacher_name
      t.string :teacher_email
      # t.references :federal_cource, foreign_key: true

      t.timestamps
    end
  end
end
