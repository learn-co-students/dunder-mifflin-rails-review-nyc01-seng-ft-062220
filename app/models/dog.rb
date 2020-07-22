class Dog < ApplicationRecord
    has_many :employees

    validates :age, numericality: true
    validates :name, presence: true
    validates :breed, presence: true
end
