class AddCommentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body, default: ''
      t.references :student, null: false, foreign_key: true
      t.timestamps
    end
  end
end
