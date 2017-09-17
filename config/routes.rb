Rails.application.routes.draw do
  root to: 'pages#home'

  resources :courses
  resources :faqs
  resources :users do
    member do
      get :confirm_email
    end
  end

  resources :admins do
    collection do
      get 'overview'
    end
  end

  get "/log_in", to: "pages#log_in"

  post '/log_in', to: 'sessions#create'
end
