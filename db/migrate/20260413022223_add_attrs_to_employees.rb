class AddAttrsToEmployees < ActiveRecord::Migration[8.1]
  def change
    add_column :employees, :date_of_joining, :date
    add_column :employees, :bio, :text
  end
end
