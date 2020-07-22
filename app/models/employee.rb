class Employee < ApplicationRecord
  belongs_to :dog

  validates :first_name, :last_name, :title, uniqueness: true
  end
