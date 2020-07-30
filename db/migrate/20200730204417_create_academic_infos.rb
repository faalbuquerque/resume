class CreateAcademicInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :academic_infos do |t|
      t.string :name_academic
      t.string :description_academic
      t.string :institution_academic
      t.integer :conclusion_academic

      t.timestamps
    end
  end
end
