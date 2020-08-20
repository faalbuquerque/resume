class AddColumnLinkToPersonalInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :personal_infos, :link_git, :string
    add_column :personal_infos, :link_site, :string
  end
end
