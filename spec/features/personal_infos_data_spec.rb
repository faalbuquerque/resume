require 'rails_helper'

feature 'personal infos form' do
  context 'add data' do
    it 'successfully' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit personal_infos_path
      
      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:add_new_date).capitalize

      fill_in I18n.t(:name).capitalize, with: 'Fabiane Albuquerque'
      fill_in I18n.t(:address).capitalize, with: 'Rua jandira, 15'
      fill_in I18n.t(:telephone).capitalize, with: '11 9 1111-2222'
      fill_in I18n.t(:email).capitalize, with: 'fa@gmail.com'
      fill_in I18n.t(:social_networks).capitalize, with: 'http://teste.com'
      fill_in I18n.t(:goals).capitalize, with: 'Estudar'
      click_button I18n.t(:save).capitalize
      
      expect(page).to have_content(I18n.t(:data_add).capitalize)
      expect(page).to have_content 'Fabiane Albuquerque'
      expect(page).to have_content '11 9 1111-2222'
      expect(page).to have_content 'fa@gmail.com'
      expect(page).to have_content 'http://teste.com'
      expect(page).to have_content 'Estudar'
    end

    it 'failure - in blank' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit personal_infos_path
      
      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:add_new_date).capitalize

      fill_in I18n.t(:name).capitalize, with: ''
      fill_in I18n.t(:address).capitalize, with: ''
      fill_in I18n.t(:telephone).capitalize, with: ''
      fill_in I18n.t(:email).capitalize, with: ''
      fill_in I18n.t(:social_networks).capitalize, with: ''
      fill_in I18n.t(:goals).capitalize, with: ''
      click_button I18n.t(:save).capitalize
      
      expect(page).to have_content("#{I18n.t(:name).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:address).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:telephone).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:email).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:social_networks).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:goals).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
