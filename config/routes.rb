Rails.application.routes.draw do
  resources :courses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #===== API =====
  namespace :api, defaults: { format: "json "} do
    resources :courses, only: [:index]
    #resources :courses, controller: :courses, only: [:index]
  end
end
