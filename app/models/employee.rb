class Employee < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :divisions, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 100
  before_save(:titleize_employee)
  scope :search, -> (employee_parameter) { where("name like ?", "%#{employee_parameter}%")} 

  private
  def titleize_employee
    self.name = self.name.titleize
  end
end

def self.rock
  where(name: "Rock")
end
