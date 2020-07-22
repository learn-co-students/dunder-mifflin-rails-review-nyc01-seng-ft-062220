class Employee < ApplicationRecord
    belongs_to :dog

    validates :alias, uniqueness: true
    validates :title, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :office, presence: true
    # does an employee need a validation to force association with dog upon creation?

    def full_name
        first_name + " " + last_name
    end
end
