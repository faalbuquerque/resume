class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name_skill
      t.integer :type_skill

      t.timestamps
    end
  end
end
