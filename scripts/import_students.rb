require 'csv'

def self.import(file)
  CSV.parse(self.parse_headers(file), headers: true) do |row|

    std = {
      "uid" => row["uid"].to_i,
      "group" => row["group"],
      "student_id" => row["student_id"].to_i,
      "name" => row["name"],
      "first_name" => row["first_name"],
      "middle_name" => row["middle_name"],
      "last_name" => row["last_name"],
      "phone" => row["phone"].to_i,
      "home_school" => row["home_school"],
      "external_email" => row["external_email"],
      "usi" => row["usi"],
      "dob" => row["dob"],
      "lnn_assessment_registered_status" => row["lnn_assessment_registered_status"],
      "lnn_assessment_completed_status" => row["lnn_assessment_completed_status"],
      "enrolment_paperwork_completed_date" => row["enrolment_paperwork_completed"],
      "enrolled_in_energySpace_userid" => row["enrolled_in_energySpace_userid"],
      "teams_group_and_chat_created_and_user_added_status" => row["teams_group_and_chat_created_and_user_added_status"],
      "Comments" => row["comments"],
      "date" => row["date"],
      "assessor_name" => row["assessor_name"],
      "campus" => row["campus"],
      "yes_no_status" => row["yes_no_status"],
      "satisfactory" => row["satisfactory"],
      "competency" => row["competency"],
      "course_code" => row["course_code"]
    }
    puts(std)
    Student.create(std)
  end
end

def self.parse_headers (file)
  File.open(file) { |f|
    first_line = f.readline
    self.headers.each { |k,v| first_line[k] &&= v }
    first_line + f.read 
  }
end

def self.headers
  {
    "Number" => "uid",
    "Class/Group" => "group",
    "Student ID" => "student_id",
    "Students Name" => "name",
    "First" => "first_name",
    "Middle Initial" => "middle_name",
    "Surname" => "last_name",
    "Mobile Phone" => "phone",
    "Home School" => "home_school",
    "External email address" => "external_email",
    "USI" => "usi",
    "Date of Birth" => "dob",
    "Registered for LNN Assessment" => "lnn_assessment_registered_status",
    "Completed LNN Assessment" => "lnn_assessment_completed_status",
    "Completed Enrolment Paperwork" =>"enrolment_paperwork_completed",
    "Enrolled in EnergySpace - Userid" => "enrolled_in_energySpace_userid",
    "Teams Group and Chat Created and user added" => "teams_group_and_chat_created_and_user_added_status",
    "Comments" => "comments",
    "Date" => "date",
    "Assessor Name" => "assessor_name",
    "Collage/Campus" => "campus",
    "Yes/No" => "yes_no_status",
    "Satisfactory" => "satisfactory",
    "Competency" => "competency",
    "Course Code" => "course_code",
  }
end

self.import("scripts/students.csv")
