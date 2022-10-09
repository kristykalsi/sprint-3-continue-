class StudentTasksController < ApplicationController
  before_action :set_student_task, only: %i[ show edit update destroy ]

  # GET /student_tasks or /student_tasks.json
  def index
    @student_tasks = StudentTask.all
  end

  # GET /student_tasks/1 or /student_tasks/1.json
  def show
  end

  # GET /student_tasks/new
  def new
    @student_task = StudentTask.new
  end

  # GET /student_tasks/1/edit
  def edit
  end

  # POST /student_tasks or /student_tasks.json
  def create
    @student = Student.find(student_task_params[:student_id])
    @student.task_ids = params[:task_ids]
    redirect_to request.referrer
  end

  # PATCH/PUT /student_tasks/1 or /student_tasks/1.json
  def update
    respond_to do |format|
      if @student_task.update(student_task_params)
        format.html { redirect_to student_task_url(@student_task), notice: "Student task was successfully updated." }
        format.json { render :show, status: :ok, location: @student_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_tasks/1 or /student_tasks/1.json
  def destroy
    @student_task.destroy

    respond_to do |format|
      format.html { redirect_to student_tasks_url, notice: "Student task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_task
      @student_task = StudentTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_task_params
      params.require(:student_task).permit(:student_id, :task_id)
    end
end
