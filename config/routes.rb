Rails.application.routes.draw do
  # Authentication routes
  root "auth#login"
  get "login", to: "auth#login"
  post "login", to: "auth#authenticate"
  get "logout", to: "auth#logout"
  
  # Todo routes
  get "todos", to: "todos#index"
  post "todos", to: "todos#create"
  get "todos/:id/edit", to: "todos#edit", as: :edit_todo
  patch "todos/:id", to: "todos#update", as: :update_todo
  delete "todos/:id", to: "todos#destroy", as: :destroy_todo
  
  # Handle favicon requests
  get "favicon.ico", to: proc { [204, {}, []] }
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
