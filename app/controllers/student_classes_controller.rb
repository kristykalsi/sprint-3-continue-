class StudentClassesController < ApplicationController

    def index
        student_id = params[:student_id]
        @student = Student.find(student_id)
        @student_classes = @student.student_classes
    end

    def new
        student_id = params[:student_id]
        @student = Student.find(student_id)
        @student_class = StudentClass.new
        @courses = Course.all
    end

    def create
        @student_class = StudentClass.new(student_class_params)
        if @student_class.save
            redirect_to student_student_classes_path(@student_class.student), notice: "Enrolled in course Successfully..."
        else
            redirect_to student_student_classes_path(@student_class.student), notice: "Error Enrolling Student in course..."
        end
    end

    def show
        @student_class = StudentClass.find(params[:id])
        @course = @student_class.course
    end
    

    def remove_student
        @student_class = StudentClass.find(params[:id])
        @student_class.destroy
        redirect_to student_student_classes_path(@student_class.student), notice: "Removed from course Successfully..."
    end

    private

    def student_class_params
        params.require(:student_class).permit(:student_id, :course_id)
    end
end
