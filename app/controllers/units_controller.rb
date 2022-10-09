class UnitsController < ApplicationController
    def index
        @unit = Unit.all
    end

    def show
        @unit = Unit.find(params[:id])
      end

    def new
        @unit = Unit.new(course_id: params[:course_id])
    end

    def create 
        @unit = Unit.new(unit_params)
        if @unit.save
          redirect_to course_path(@unit.course)
        else
          render :new
        end
    end

    def delete_unit
      @unit = Unit.find(params[:id])
      @unit.destroy
      redirect_to request.referrer
    end

    def show_tasks
      @student_class = StudentClass.find(params[:student_class_id])
      @unit = Unit.find(params[:unit_id])
      @tasks = @unit.tasks
      @student_tasks = @student_class.student.tasks.where("unit_id = ?", @unit.id)
    end

    def unit_params
        params.require(:unit).permit(:unit_name, :unit_code, :course_id)
    end
end
