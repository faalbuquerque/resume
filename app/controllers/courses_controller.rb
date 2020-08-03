class CoursesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    return redirect_to course_path(@course) if @course.save

    render :new
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    return redirect_to course_path(@course) if @course.update(course_params)

    render :edit
  end

  def destroy
    @courses = Course.all
    @course = Course.find(params[:id])
    return redirect_to courses_path if @course.delete

    render :index
  end

  private

  def course_params
    params.require(:course).permit(:name_course, :description_course,
                                  :institution_course, :time_course,
                                  :conclusion_course, :start_course,
                                  :end_course)
  end
end
