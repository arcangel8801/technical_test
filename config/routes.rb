Rails.application.routes.draw do
  resources :events
  resources :schedule_details
  resources :schedules
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
