require 'rails_helper'
feature 'courses form' do
  context 'add data' do
    it 'successfully' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit courses_path
      
      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:add_new_date).capitalize

      fill_in I18n.t(:name_course).capitalize, with: 'Desenvolvimento de Software'
      fill_in I18n.t(:description_course).capitalize, with: 'Um curso legal'
      fill_in I18n.t(:institution_course).capitalize, with: 'SENAI'
      fill_in I18n.t(:time_course).capitalize, with: '40 horas'
      page.select 'Concluido', from: I18n.t(:conclusion_course).capitalize
      fill_in I18n.t(:start_course).capitalize, with: '2019-12-30'
      fill_in I18n.t(:end_course).capitalize, with: '2020-02-29'

      click_button I18n.t(:save).capitalize

      expect(page).to have_content(I18n.t(:data_add).capitalize)
      expect(page).to have_content 'Desenvolvimento de Software'
      expect(page).to have_content 'Um curso legal'
      expect(page).to have_content 'SENAI'
      expect(page).to have_content '40 horas'
      expect(page).to have_content '01'
      expect(page).to have_content '2019-12-30'
      expect(page).to have_content '2020-02-29'
    end

    it 'in blank' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit courses_path
      
      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:add_new_date).capitalize

      fill_in I18n.t(:name_course).capitalize, with: ''
      fill_in I18n.t(:description_course).capitalize, with: ''
      fill_in I18n.t(:institution_course).capitalize, with: ''
      fill_in I18n.t(:time_course).capitalize, with: ''
      fill_in I18n.t(:start_course).capitalize, with: ''
      fill_in I18n.t(:end_course).capitalize, with: ''

      click_button I18n.t(:save).capitalize
      
      expect(page).to have_content("#{I18n.t(:name_course).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:description_course).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:institution_course).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:time_course).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:start_course).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:end_course).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end