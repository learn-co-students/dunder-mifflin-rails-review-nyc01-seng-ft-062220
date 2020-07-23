class Dog < ApplicationRecord
    has_many :employees, dependent: :destroy

    #validations? 
    validates :name, :breed, presence: true
    validates :age, numericality: true
end
