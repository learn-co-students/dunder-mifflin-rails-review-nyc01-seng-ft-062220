class Employee < ApplicationRecord
    belongs_to :dog

    validates :first_name, :last_name, :office, :title, :alias, presence: true
    validates :title, :alias, uniqueness: true

end
