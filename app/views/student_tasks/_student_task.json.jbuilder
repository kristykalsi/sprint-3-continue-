json.extract! student_task, :id, :student_id, :task_id, :created_at, :updated_at
json.url student_task_url(student_task, format: :json)
