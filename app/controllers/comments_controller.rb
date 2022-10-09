class CommentsController < ApplicationController


  def index
    @students = Student.all
  end

  def show_comments
    student_id = params["student_id"]
    redirect_to comments_path if student_id.blank?
    @student = Student.find(student_id)
    @students = Student.all
    @comments = @student.comments
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referrer
  end
end