class CreateStudentdocs < ActiveRecord::Migration[8.1]
  def change
    create_table :studentdocs do |t|
      t.string :name
      t.string :doc_type
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
