class RenameBioEmployee < ActiveRecord::Migration[8.1]
  def change
    rename_column :employees, :bio, :about
  end
end
