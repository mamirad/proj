class CreateFederalCourceTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :federal_cource_teachers do |t|
      t.references :adminteacher, foreign_key: true
      t.references :federal_cource, foreign_key: true

      t.timestamps
    end
  end
end
