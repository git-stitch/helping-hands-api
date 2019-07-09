Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :organizations, only: [:index,:create,:show,:update,:destroy]
      resources :users, only: [:index,:create,:show,:update,:destroy]
      resources :events, only: [:create,:show,:update,:destroy]
      resources :attendees, only: [:create,:update,:destroy]
      resources :organization_contact, only: [:create,:update,:destroy]
      resources :organization_social, only: [:create,:update,:destroy]
      resources :organization_image, only: [:create,:update,:destroy]
      resources :organization_members, only: [:index,:create,:update,:destroy]
      post "/login", to: "auth#login"
      post "/org_login", to: "auth#org_login"
      post "/donate", to: "users#donate"

      get "/auto_login", to: "auth#auto_login"
      get "/org_auto_login", to: "auth#org_auto_login"
    end
  end
end
