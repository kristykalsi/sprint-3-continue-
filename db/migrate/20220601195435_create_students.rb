class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.integer :uid
      t.string :group
      t.integer :student_id
      t.string :name
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :phone
      t.string :home_school
      t.string :external_email
      t.string :usi
      t.datetime :dob
      t.boolean :lnn_assessment_registered_status
      t.boolean :lnn_assessment_completed_status
      t.boolean :enrolment_paperwork_completed__status
      t.datetime :enrolment_paperwork_completed_date
      t.string :enrolled_in_energySpace_userid
      t.boolean :teams_group_and_chat_created_and_user_added_status
      t.string :Comments
      t.datetime :date
      t.string :assessor_name
      t.string :campus
      t.boolean :yes_no_status
      t.string :satisfactory
      t.string :competency
      t.string :course_code
      t.string :course_name

      t.timestamps
    end
  end
end
