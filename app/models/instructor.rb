class Instructor < ApplicationRecord
    has_many :students

    def average_age()
        self.students.average(:age)
    end

    def sorted_students()
        self.students.sort_by(&:name)
    end
end
