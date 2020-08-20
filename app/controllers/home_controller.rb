class HomeController < ApplicationController
  def index
    @personal_infos = PersonalInfo.all
    @academic_infos = AcademicInfo.all
    @courses = Course.all
    @skills = Skill.all
    @experiences = Experience.all
    @projects = Project.all
  end
end
