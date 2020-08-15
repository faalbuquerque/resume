require 'rails_helper'
feature 'skills form' do
  context 'add data' do
    it 'successfully' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit skills_path
      
      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:add_new_date).capitalize

      fill_in 'Nome da Skill', with: 'Focada'
      page.select 'Soft', from: "Tipo"

      click_button I18n.t(:save).capitalize

      expect(page).to have_content(I18n.t(:data_add).capitalize)
      expect(page).to have_content 'Focada'
      expect(page).to have_content 'Soft'

    end

    it 'in blank' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit skills_path
      
      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:add_new_date).capitalize

      fill_in 'Nome da Skill', with: ''
      page.select '', from: "Tipo"

      click_button I18n.t(:save).capitalize
      
      expect(page).to have_content("Nome da Skill #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("Tipo #{I18n.t('activerecord.errors.messages.blank')}")
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end