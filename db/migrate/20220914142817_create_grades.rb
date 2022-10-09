class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.references :student, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.boolean :enrolled
      t.boolean :cy
      t.boolean :awaiting_confirmation
      t.boolean :profiling
      t.boolean :missed
      t.boolean :skills
      t.boolean :ukt
      t.boolean :waiting_on_staff

      t.timestamps
    end
  end
end
