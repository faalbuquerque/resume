require 'rails_helper'
feature 'courses' do
  context 'edit data' do
    it 'successfully' do
      clean_admin
      admin = FactoryBot.create(:admin)

      course = FactoryBot.create(:course, name_course: 'Ingles')
      course_1 = FactoryBot.create(:course, name_course: 'ESP', start_course: '2019-06-30')
      course_2 = FactoryBot.create(:course, name_course: 'Japones', start_course: '2020-05-06')

      visit courses_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      find("a#course_n_#{course_1.id}").click

      fill_in I18n.t(:name_course).capitalize, with: 'Espanhol'
      click_button I18n.t(:save).capitalize

      visit courses_path

      expect(page).to have_content 'Ingles'
      expect(page).to_not have_content 'ESP'
      expect(page).to have_content 'Espanhol'
      expect(page).to have_content 'Japones'
    end

    it 'delete' do
      clean_admin
      admin = FactoryBot.create(:admin)
      course = FactoryBot.create(:course)
      course_1 = FactoryBot.create(:course, name_course: 'Java')
      course_2 = FactoryBot.create(:course, name_course: 'PHP')
      
      visit courses_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      find("a#course_d_#{course_1.id}").click

      expect(page).to have_content 'Desenvolvimento de Software'
      expect(page).to_not have_content 'Java'
      expect(page).to have_content 'PHP'
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
