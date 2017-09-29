Rails.application.routes.draw do
  root to: 'pages#home'

  resources :professors
  resources :courses
  resources :faqs
  resources :discussions
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
  get '/upvote', to: 'votes#upvote'
  get '/downvote', to: 'votes#downvote'

  post '/log_in', to: 'sessions#create'
end
