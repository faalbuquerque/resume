class ProjectsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    return redirect_to project_path(@project) if @project.save

    render :new
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    return redirect_to project_path(@project) if @project.update(project_params)

    render :edit
  end

  def destroy
    @projects = Project.all
    @project = Project.find(params[:id]) if exists_data
    return redirect_to projects_path if exists_data && @project.delete

    flash.now[:alert] = t(:non_existing_data).capitalize
    render :index
  end

  private

  def project_params
    params.require(:project).permit(:name_project, :description_project,
                                    :link_project, :img_project)
  end

  def exists_data
    Project.exists?(params[:id])
  end
end
