class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :occupation
      t.string :description_occupation
      t.string :company
      t.date :start_experience
      t.date :end_experience

      t.timestamps
    end
  end
end
