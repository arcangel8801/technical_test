Rails.application.routes.draw do

  scope '(:locale)', locale: /es|en/, defaults: { locale: 'es' } do
    root 'events#index'
    resources :events, except: :index
    resources :schedules
    resources :schedule_details
  end


end
