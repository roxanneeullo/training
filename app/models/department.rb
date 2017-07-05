class Department < ApplicationRecord
  has_many :users
  
  validates :department_name, presence: true, uniqueness: true
  
end
