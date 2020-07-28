class CreatePersonalInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_infos do |t|
      t.string :name
      t.string :address
      t.string :fone
      t.string :email
      t.string :links
      t.string :goals

      t.timestamps
    end
  end
end
