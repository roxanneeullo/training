class RemoveDepartmentFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :department, :string
  end
end
