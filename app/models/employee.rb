class Employee < ApplicationRecord
    belongs_to :dog

    #validations 
    validates :first_name, :last_name, :office, :alias, :title, presence: true
    validates :alias, :title, uniqueness: true
end
