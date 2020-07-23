class Dog < ApplicationRecord
    has_many :employees

    def num_employees
        self.employees.count
    end
end
