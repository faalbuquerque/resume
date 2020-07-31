class AddColumnStartDateToAcademicInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :academic_infos, :start_date, :date
    add_column :academic_infos, :end_date, :date
  end
end
