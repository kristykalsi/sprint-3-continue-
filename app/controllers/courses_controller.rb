class CoursesController < ApplicationController
    before_action :require_login

    def index
        @course = Course.all
        @course = Course.order(params[:sort])
    end


    def show
        @course = Course.find(params[:id])

    end

    def new
        @course = Course.new
    end

    def create 
        @course = Course.new(course_params)
        if @course.save
          redirect_to courses_path
        else
          render :new
        end
    end

    def delete_course
        @course = Course.find(params[:id])
        @course.destroy
        redirect_to request.referrer
    end

    def course_params
        params.require(:course).permit(:course_name, :course_code)
    end
      

end
