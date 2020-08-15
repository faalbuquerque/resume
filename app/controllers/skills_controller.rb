class SkillsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    return redirect_to skill_path(@skill) if @skill.save

    render :new
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    return redirect_to skill_path(@skill) if @skill.update(skill_params)

    render :edit
  end

  def destroy
    @skills = Skill.all
    @skill = Skill.find(params[:id]) if exists_data
    return redirect_to skills_path if exists_data && @skill.delete

    flash.now[:alert] = t(:non_existing_data).capitalize
    render :index
  end

  private

  def skill_params
    params.require(:skill).permit(:name_skill, :type_skill)
  end
end

def exists_data
  Skill.exists?(params[:id])
end
