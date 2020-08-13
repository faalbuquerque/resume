require 'rails_helper'
feature 'experiences form' do
  context 'edit data' do
    it 'successfully' do
      clean_admin
      admin = FactoryBot.create(:admin)

      experience = FactoryBot.create(:experience, occupation: 'Designer')
      experience_1 = FactoryBot.create(:experience, occupation: 'Desenhista', company: 'Folha')
      experience_2 = FactoryBot.create(:experience, occupation: 'Suporte')

      visit experiences_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      find("a#experience_e_#{experience_1.id}").click

      fill_in I18n.t(:occupation).capitalize, with: 'Analista'
      fill_in I18n.t(:company).capitalize, with: 'Porto Seguro'

      click_button I18n.t(:save).capitalize

      visit experiences_path

      expect(page).to_not have_content 'Desenhista'
      expect(page).to have_content 'Analista'
      expect(page).to_not have_content 'Folha'
      expect(page).to have_content 'Porto Seguro'

      expect(page).to have_content 'Designer'
      expect(page).to have_content 'Suporte'
    end

    it 'in blank' do
      clean_admin
      test = FactoryBot.create(:admin)
      experience_test = FactoryBot.create(:experience)

      visit experiences_path
      
      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      find("a#experience_e_#{experience_test.id}").click

      fill_in I18n.t(:occupation).capitalize, with: ''
      fill_in I18n.t(:description_occupation).capitalize, with: ''
      fill_in I18n.t(:company).capitalize, with: ''
      fill_in I18n.t(:start_experience).capitalize, with: ''
      fill_in I18n.t(:end_experience).capitalize, with: ''

      click_button I18n.t(:save).capitalize

      expect(page).to have_content("#{I18n.t(:occupation).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:description_occupation).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:company).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:start_experience).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:end_experience).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
    end

    it 'delete' do
      clean_admin
      admin = FactoryBot.create(:admin)
      experience = FactoryBot.create(:experience)
      experience_1 = FactoryBot.create(:experience, occupation: 'Designer')
      experience_2 = FactoryBot.create(:experience, occupation: 'Suporte')
      
      visit experiences_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      find("a#experience_d_#{experience_1.id}").click

      expect(page).to have_content 'Programador'
      expect(page).to_not have_content 'Designer'
      expect(page).to have_content 'Suporte'
    end

    it 'delete - non existing record' do
      clean_admin
      admin = FactoryBot.create(:admin)
      experience = FactoryBot.create(:experience)
    
      visit experiences_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      Experience.first.destroy!

      click_link I18n.t(:delete).capitalize

      expect(page).to_not have_content 'Programador'
      expect(page).to have_content I18n.t(:non_existing_data).capitalize
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
