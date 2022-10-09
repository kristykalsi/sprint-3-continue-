class Unit < ApplicationRecord
    belongs_to :course
    has_many :students, through: :grades
    has_many :grades
    has_many :tasks
end
