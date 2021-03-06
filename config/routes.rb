Rails.application.routes.draw do
  root to: 'pages#home'

  resources :professors
  resources :courses
  resources :faqs
  resources :discussions
  resources :comments, only: [:create, :update, :edit]
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
  get "/contact", to: "pages#contact"
  get "/about", to: "pages#about"

  post '/log_in', to: 'sessions#create'

  delete '/sign_out', to: 'sessions#destroy'
end
