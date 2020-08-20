class AddColumnWorkingToExperience < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :check_work, :integer
  end
end
