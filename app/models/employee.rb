class Employee < ApplicationRecord
  has_many :documents
  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :state, presence: true
  validates :address, presence: true
  validates :country, presence: true
  validates :date_of_birth, presence: true
  validates :date_of_joining, presence: true
  validates :job_title, presence: true
  validates :bio, presence: true

  def get_name
    "#{first_name} #{last_name}".strip
  end

  def name_with_email
    "#{get_name}   (#{email})".strip
  end


  def get_address
    "#{address}, #{state}, #{country}".strip
  end
end
