class Student < ApplicationRecord
    validates :student_id, :name, :group, presence: true
    has_many :student_classes
    has_many :student_tasks
    has_many :courses, through: :student_classes
    has_many :grades
    has_many :tasks, through: :student_tasks
    # has_many :units, through: :grades

    has_many :comments

    accepts_nested_attributes_for :comments, reject_if: ->(c){ c['body'].blank? }, allow_destroy: true
end
