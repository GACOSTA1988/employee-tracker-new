class Employee < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :divisions, dependent: :destroy
end
