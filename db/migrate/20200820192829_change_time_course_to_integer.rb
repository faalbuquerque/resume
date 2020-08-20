class ChangeTimeCourseToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :course, :time_course, :integer
  end
end
