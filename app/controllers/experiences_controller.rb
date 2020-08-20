class ExperiencesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    return redirect_to experience_path(@experience) if @experience.save

    render :new
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
    if @experience.update(experience_params)
      return redirect_to experience_path(@experience)
    end

    render :edit
  end

  def destroy
    @experiences = Experience.all
    @experience = Experience.find(params[:id]) if exists_data
    return redirect_to experiences_path if exists_data && @experience.delete

    flash.now[:alert] = t(:non_existing_data).capitalize
    render :index
  end

  private

  def experience_params
    params.require(:experience).permit(:occupation, :description_occupation,
                                       :company, :start_experience,
                                       :end_experience, :check_work)
  end

  def exists_data
    Experience.exists?(params[:id])
  end
end
