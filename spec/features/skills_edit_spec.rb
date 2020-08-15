require 'rails_helper'
feature 'skills form' do
  context 'edit skills' do
    it 'successfully' do
      clean_admin
      admin = FactoryBot.create(:admin)

      skill = FactoryBot.create(:skill, name_skill: 'Legal')
      skill_1 = FactoryBot.create(:skill, name_skill: 'Pontual')

      visit skills_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      find("a#skill_n_#{skill_1.id}").click

      fill_in "Nome da Skill", with: 'Atenciosa'
      click_button I18n.t(:save).capitalize

      visit skills_path

      expect(page).to have_content 'Legal'
      expect(page).to_not have_content 'Pontual'
      expect(page).to have_content 'Atenciosa'

    end

    it 'in blank' do
      clean_admin
      test = FactoryBot.create(:admin)
      skill_test = FactoryBot.create(:skill)

      visit skills_path
      
      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      find("a#skill_n_#{skill_test.id}").click

      fill_in "Nome da Skill", with: ''
      click_button I18n.t(:save).capitalize

      expect(page).to have_content("Nome da Skill #{I18n.t('activerecord.errors.messages.blank')}")
    end

    it 'delete' do
      clean_admin
      admin = FactoryBot.create(:admin)
      skill = FactoryBot.create(:skill)
      skill_1 = FactoryBot.create(:skill, name_skill: 'Legal')

      
      visit skills_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      find("a#skill_d_#{skill_1.id}").click

      expect(page).to have_content 'Curiosa'
      expect(page).to_not have_content 'Legal'
    end

    it 'delete - non existing record' do
      clean_admin
      admin = FactoryBot.create(:admin)
      skill = FactoryBot.create(:skill)
    
      visit skills_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      Skill.first.destroy!

      click_link I18n.t(:delete).capitalize

      expect(page).to_not have_content 'Curiosa'
      expect(page).to have_content I18n.t(:non_existing_data).capitalize
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
