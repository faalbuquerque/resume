require 'rails_helper'
feature 'personal infos' do
  context 'edit data' do
    it 'successfully' do
      clean_admin
      admin = FactoryBot.create(:admin)
      personal_info = FactoryBot.create(:personal_info)

      visit personal_infos_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:edit)

      fill_in I18n.t(:name).capitalize, with: 'Fabiane Souza'
      fill_in I18n.t(:email).capitalize, with: 'fabiane@teste.com'
      fill_in I18n.t(:social_networks).capitalize, with: 'http://fa.com'
      click_button I18n.t(:save).capitalize

      expect(page).to have_content 'Fabiane Souza'
      expect(page).to have_content 'fabiane@teste.com'
      expect(page).to have_content 'http://fa.com'
    end

    it 'failure - in blank' do
      clean_admin
      admin = FactoryBot.create(:admin)
      personal_info = FactoryBot.create(:personal_info)

      visit personal_infos_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:edit)

      fill_in I18n.t(:name).capitalize, with: ''
      fill_in I18n.t(:email).capitalize, with: ''
      fill_in I18n.t(:social_networks).capitalize, with: ''
      click_button I18n.t(:save).capitalize

      expect(page).to have_content("#{I18n.t(:name).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:email).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:social_networks).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
