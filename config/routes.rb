Rails.application.routes.draw do
  resources :dashboards
  resources :courses do
    resources :users do
      get 'minus_student', on: :member, controller: :courses
      get 'add_student', on: :member, controller: :courses
    end
  end


  devise_for :users


  root "homes#index"
  #get "/courses/:course_id/students/:student_id", to: "courses#add_student", as: "add_student"
  # get "/courses/:course_id/students/:student_id", to: "courses#add_student", as: "add_student"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end