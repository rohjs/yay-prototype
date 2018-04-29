Rails.application.routes.draw do
  root "homes#index"

  resources :dashboards
  resources :courses do
    resources :users do
      get 'minus_student', on: :member, controller: :courses
      get 'add_student', on: :member, controller: :courses
    end
  end


  devise_for :users
  post '/assignments/check_assignment' => 'assignments#check_assignment', as: 'check_assignment'

  #get "/courses/:course_id/students/:student_id", to: "courses#add_student", as: "add_student"
  # get "/courses/:course_id/students/:student_id", to: "courses#add_student", as: "add_student"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
