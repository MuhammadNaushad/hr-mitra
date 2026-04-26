class RemoveMiddleNameFromEmployees < ActiveRecord::Migration[8.1]
  def change
    remove_column :employees, :middle_name, :string
  end
end
