class AcademicInfosController < ApplicationController
  before_action :authenticate_admin!

  def index
    @academic_infos = AcademicInfo.all
  end

  def new
    @academic_info = AcademicInfo.new
  end

  def create
    @academic_info = AcademicInfo.new(academic_info_params)
    return redirect_to academic_info_path(@academic_info) if @academic_info.save

    render :new
  end

  def show
    @academic_info = AcademicInfo.find(params[:id])
  end

  def edit
    @academic_info = AcademicInfo.find(params[:id])
  end

  def update
    @academic_info = AcademicInfo.find(params[:id])
    if @academic_info.update(academic_info_params)
      return redirect_to academic_info_path(@academic_info)
    end

    render :edit
  end

  def destroy
    @academic_info = AcademicInfo.find(params[:id])
    return redirect_to academic_infos_path if @academic_info.delete

    render academic_infos_path
  end

  private

  def academic_info_params
    params.require(:academic_info).permit(:name_academic, :description_academic,
                                          :institution_academic, :start_date,
                                          :conclusion_academic, :end_date)
  end
end
