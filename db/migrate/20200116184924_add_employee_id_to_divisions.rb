class AddEmployeeIdToDivisions < ActiveRecord::Migration[5.2]
  def change
    add_column(:divisions, :employee_id, :integer)
  end
end
