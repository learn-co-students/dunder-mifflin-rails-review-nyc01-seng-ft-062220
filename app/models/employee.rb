class Employee < ApplicationRecord
    belongs_to :dog
    validates :first_name, :last_name, :alias, :title, :office,:dog_id, presence: true
end
