require 'rails_helper'
feature 'projects form' do
  context 'add data' do
    it 'successfully' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit projects_path

      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:add_new_date).capitalize

      fill_in I18n.t(:name_project).capitalize, with: 'Cifras'
      fill_in I18n.t(:description_project).capitalize, with: 'Decodificar Cifra'
      fill_in I18n.t(:link_project).capitalize, with: 'http://cifra.com'
      fill_in I18n.t(:img_project).capitalize, with: 'imagem'
      click_button I18n.t(:save).capitalize

      expect(page).to have_content(I18n.t(:data_add).capitalize)
      expect(page).to have_content 'Cifras'
      expect(page).to have_content 'Decodificar Cifra'
      expect(page).to have_content 'http://cifra.com'
      expect(page).to have_content 'imagem'
    end

    it 'in blank' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit projects_path

      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize
      click_link I18n.t(:add_new_date).capitalize

      fill_in I18n.t(:name_project).capitalize, with: ''
      fill_in I18n.t(:description_project).capitalize, with: ''
      fill_in I18n.t(:link_project).capitalize, with: ''
      click_button I18n.t(:save).capitalize

      expect(page).to have_content("#{I18n.t(:name_project).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:description_project).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:link_project).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
