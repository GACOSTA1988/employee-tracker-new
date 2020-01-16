class Employee < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :divisions, dependent: :destroy
  validates :name, presence: true
   validates_length_of :name, maximum: 100
   before_save(:titleize_employee)

 private
   def titleize_employee
     self.name = self.name.titleize
   end
end
