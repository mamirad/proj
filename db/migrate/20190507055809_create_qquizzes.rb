class CreateQquizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :qquizzes do |t|
      t.date :expire_date
      t.references :teachercourse, foreign_key: true

      t.timestamps
    end
  end
end
