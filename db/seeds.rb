# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

User.create!([{
    email: "test@mail.com",
    password_digest: "$2a$12$t7npX4EXPTbLMWZ3Kwwy8.Mo/A.V5j4IvvEehJXjBNIZ/fEPx2MbC"
}])

p "Created #{User.count} users"

5.times do |i|
    puts "creating course #{i+1}"
Course.create(
    course_name: "Intro to electronics #{i+1}",
    course_code: "ELEC200#{i+1}"
)
end

p "Created #{Course.count} courses"

Course.all.each do |course|
    course.units.create(unit_name: "unit 1", unit_code: 'WQEF123')
    course.units.create(unit_name: "unit 2", unit_code: 'SADQ456')
end