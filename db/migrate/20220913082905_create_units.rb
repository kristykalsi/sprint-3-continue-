class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :unit_name
      t.string :unit_code
      t.boolean :enrolled
      t.boolean :cy
      t.boolean :awaiting_confirmation
      t.boolean :profiling
      t.boolean :missed
      t.boolean :skills
      t.boolean :ukt
      t.boolean :waiting_on_staff
      t.integer :course_id

      t.timestamps
    end
  end
end
