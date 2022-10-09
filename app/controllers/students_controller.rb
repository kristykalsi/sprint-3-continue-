class StudentsController < ApplicationController
  before_action :require_login

  def index
    if params[:search]
      search_students 
    end

    @student = Student.all
    @student = Student.order(params[:sort])
  end

  def new
    @student = Student.new
  end

  def create 
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end
  def student_params
    params.require(:student).permit(:student_id, :name, :group, :external_email, :home_school, :assessor_name, :campus, :phone, :usi, :lnn_assessment_registered_status, :lnn_assessment_completed_status, :enrolment_paperwork_completed__status, :enrolment_paperwork_completed_date, :enrolled_in_energySpace_userid, :teams_group_and_chat_created_and_user_added_status, :date, :yes_no_status, :satisfactory, :competency, :course_code, comments_attributes: [:body, :_destroy])
  end

  def search_students
    if @student = Student.all.find{|student| student.name.include?(params[:search])}
      redirect_to students_path(@student)
    end
  end

  def edit
    @student = Student.find_by_student_id(params[:id])
    @student.comments.build
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end
  
  def show
    @student = Student.find_by_student_id(params[:id])
  end
end