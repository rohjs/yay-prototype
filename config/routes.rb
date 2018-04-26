Rails.application.routes.draw do
  resources :dashboards
  resources :courses
  devise_for :users,
    :controllers => { :registrations => "registrations" }
    

  root "homes#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
