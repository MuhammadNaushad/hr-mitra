class Student < ApplicationRecord
  has_many :studentdocs

  validates :name, :roll_no, presence: true
  validates :email, presence: true, uniqueness: true
end
