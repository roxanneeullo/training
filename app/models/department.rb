class Department < ApplicationRecord
  has_many :users, dependent: :destroy
  
  validates :department_name, presence: true, uniqueness: true, length: { maximum: 30 }

end
