class PersonalInfosController < ApplicationController
  before_action :authenticate_admin!

  def index
    @personal_infos = PersonalInfo.all
  end

  def show
    @personal_info = PersonalInfo.find(params[:id])
  end

  def edit
    @personal_info = PersonalInfo.find(params[:id])
  end

  def update
    @personal_info = PersonalInfo.find(params[:id])
    if @personal_info.update(personal_info_params)
      return redirect_to personal_info_path(@personal_info)
    end

    render :edit
  end

  def destroy
    @personal_infos = PersonalInfo.all
    @personal_info = PersonalInfo.find(params[:id]) if exists_data
    if exists_data && @personal_info.delete
      return redirect_to personal_infos_path
    end

    flash.now[:alert] = t(:non_existing_data).capitalize
    render :index
  end

  private

  def personal_info_params
    params.require(:personal_info).permit(:name, :address, :email,
                                          :fone, :links, :goals)
  end

  def exists_data
    PersonalInfo.exists?(params[:id])
  end
end
