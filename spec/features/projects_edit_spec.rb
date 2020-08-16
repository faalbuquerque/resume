require 'rails_helper'
feature 'projects form' do
  context 'edit data' do
    it 'successfully' do
      clean_admin
      admin = FactoryBot.create(:admin)

      project = FactoryBot.create(:project, name_project: 'Blog')
      project_1 = FactoryBot.create(:project, name_project: 'App')
      project_2 = FactoryBot.create(:project, name_project: 'Enquete')

      visit projects_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      find("a#project_e_#{project_1.id}").click

      fill_in I18n.t(:name_project).capitalize, with: 'Aplicativo'
      click_button I18n.t(:save).capitalize

      visit projects_path

      expect(page).to have_content 'Blog'
      expect(page).to_not have_content 'App'
      expect(page).to have_content 'Aplicativo'
      expect(page).to have_content 'Enquete'
    end

    it 'in blank' do
      clean_admin
      test = FactoryBot.create(:admin)
      project_test = FactoryBot.create(:project)

      visit projects_path
      
      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      find("a#project_e_#{project_test.id}").click

      fill_in I18n.t(:name_project).capitalize, with: ''
      fill_in I18n.t(:description_project).capitalize, with: ''
      fill_in I18n.t(:link_project).capitalize, with: ''
      click_button I18n.t(:save).capitalize

      expect(page).to have_content("#{I18n.t(:name_project).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:description_project).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:link_project).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
    end

    it 'delete' do
      clean_admin
      admin = FactoryBot.create(:admin)
      project = FactoryBot.create(:project)
      project_1 = FactoryBot.create(:project, name_project: 'Dois sites')
      project_2 = FactoryBot.create(:project, name_project: 'Ao vivo')
      
      visit projects_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      find("a#project_d_#{project_1.id}").click

      expect(page).to have_content 'Site'
      expect(page).to_not have_content 'Dois sites'
      expect(page).to have_content 'Ao vivo'
    end

    it 'delete - non existing record' do
      clean_admin
      admin = FactoryBot.create(:admin)
      project = FactoryBot.create(:project)
    
      visit projects_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      Project.first.destroy!

      click_link I18n.t(:delete).capitalize

      expect(page).to_not have_content 'Site'
      expect(page).to have_content I18n.t(:non_existing_data).capitalize
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
