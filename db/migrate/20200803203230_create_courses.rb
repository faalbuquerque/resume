class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name_course
      t.string :description_course
      t.string :institution_course
      t.string :time_course
      t.boolean :conclusion_course
      t.date :start_course
      t.date :end_course

      t.timestamps
    end
  end
end
