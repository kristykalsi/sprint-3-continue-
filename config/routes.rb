Rails.application.routes.draw do
  resources :student_tasks
  resources :student_classes do
    resources :units do
      get 'show-tasks', to: "units#show_tasks", as: :show_tasks
      resources :tasks
    end
    member  do 
      get '/remove-student', to: "student_classes#remove_student", as: :remove_student_from_course
    end
  end
  resources :grades
  resources :courses do
    member do
      get 'delete-course', to: "courses#delete_course", as: :delete_course
    end
    resources :units
  end

  resources :units do
    member do
      get 'delete-unit', to: "units#delete_unit", as: :delete_unit
    end
    resources :tasks do
      get '/delete-task', to: "tasks#delete_task", as: :delete_task
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sessions#new"

  resources :users, only: [:index, :new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :students, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :student_classes
  end

  resources :comments

  get 'comments/:student_id/show-comments', to: "comments#show_comments", as: :show_comments

  get 'delete-comment/:id', to: "comments#destroy", as: :delete_comment

end
