require "application_system_test_case"

class StudentTasksTest < ApplicationSystemTestCase
  setup do
    @student_task = student_tasks(:one)
  end

  test "visiting the index" do
    visit student_tasks_url
    assert_selector "h1", text: "Student tasks"
  end

  test "should create student task" do
    visit student_tasks_url
    click_on "New student task"

    fill_in "Student", with: @student_task.student_id
    fill_in "Task", with: @student_task.task_id
    click_on "Create Student task"

    assert_text "Student task was successfully created"
    click_on "Back"
  end

  test "should update Student task" do
    visit student_task_url(@student_task)
    click_on "Edit this student task", match: :first

    fill_in "Student", with: @student_task.student_id
    fill_in "Task", with: @student_task.task_id
    click_on "Update Student task"

    assert_text "Student task was successfully updated"
    click_on "Back"
  end

  test "should destroy Student task" do
    visit student_task_url(@student_task)
    click_on "Destroy this student task", match: :first

    assert_text "Student task was successfully destroyed"
  end
end
