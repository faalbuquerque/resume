class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name_project
      t.string :description_project
      t.string :link_project
      t.string :img_project

      t.timestamps
    end
  end
end
