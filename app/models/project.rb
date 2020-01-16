class Project < ApplicationRecord
  belongs_to :employee
  validates :name, presence: true
   validates_length_of :name, maximum: 100
end
