Rails.application.routes.draw do
  resources :dashboards
  resources :courses
  devise_for :users


  root "homes#index"
  get "/courses/:course_id/students/:student_id", to: "courses#add_student", as: "add_student"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end