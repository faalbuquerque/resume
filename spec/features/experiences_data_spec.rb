require 'rails_helper'
feature 'experiences form' do
  context 'add data' do
    it 'successfully' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit experiences_path

      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:add_new_date).capitalize

      fill_in I18n.t(:occupation).capitalize, with: 'Desenvolvedor'
      fill_in I18n.t(:description_occupation).capitalize, with: 'Desenvolver sites e sistemas'
      fill_in I18n.t(:company).capitalize, with: 'SENAI'
      fill_in I18n.t(:start_experience).capitalize, with: '2018-12-11'
      page.select 'Sim', from: I18n.t(:check_work).capitalize
      click_button I18n.t(:save).capitalize

      expect(page).to have_content 'Desenvolvedor'
      expect(page).to have_content 'Desenvolver sites e sistemas'
      expect(page).to have_content 'SENAI'
      expect(page).to have_content '2018-12-11'
      expect(page).to have_content 'Sim'
    end

    it 'in blank' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit experiences_path

      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:add_new_date).capitalize

      fill_in I18n.t(:occupation).capitalize, with: ''
      fill_in I18n.t(:description_occupation).capitalize, with: ''
      fill_in I18n.t(:company).capitalize, with: ''
      fill_in I18n.t(:start_experience).capitalize, with: ''

      click_button I18n.t(:save).capitalize

      expect(page).to have_content("#{I18n.t(:occupation).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:description_occupation).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:company).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:start_experience).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
