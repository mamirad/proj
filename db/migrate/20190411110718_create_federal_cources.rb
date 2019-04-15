class CreateFederalCources < ActiveRecord::Migration[5.2]
  def change
    create_table :federal_cources do |t|
      t.string :cource_name
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
