class Employee < ApplicationRecord
    belongs_to :dog

    validates :alias, uniqueness: true
    validates :title, uniqueness: true

    def full_name
        @full_name = " "
        @full_name << self.first_name 
        @full_name << " " + self.last_name
        @full_name
    end
end
