Rails.application.routes.draw do
  root to: 'pages#home'

  resources :users

  get "/log_in", to: "pages#log_in"
end
