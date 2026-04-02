class Employee < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :state, presence: true
  validates :country, presence: true

  def get_name
    "#{first_name} #{last_name}".strip
  end

  def get_address
    "#{address}, #{state}, #{country}".strip
  end
end
