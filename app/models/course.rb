class Course < ApplicationRecord
    has_many :student_classes
    has_many :students, through: :student_classes
    has_many :units
end
