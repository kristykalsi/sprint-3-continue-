require "test_helper"

class StudentTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_task = student_tasks(:one)
  end

  test "should get index" do
    get student_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_student_task_url
    assert_response :success
  end

  test "should create student_task" do
    assert_difference("StudentTask.count") do
      post student_tasks_url, params: { student_task: { student_id: @student_task.student_id, task_id: @student_task.task_id } }
    end

    assert_redirected_to student_task_url(StudentTask.last)
  end

  test "should show student_task" do
    get student_task_url(@student_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_task_url(@student_task)
    assert_response :success
  end

  test "should update student_task" do
    patch student_task_url(@student_task), params: { student_task: { student_id: @student_task.student_id, task_id: @student_task.task_id } }
    assert_redirected_to student_task_url(@student_task)
  end

  test "should destroy student_task" do
    assert_difference("StudentTask.count", -1) do
      delete student_task_url(@student_task)
    end

    assert_redirected_to student_tasks_url
  end
end
