Rails.application.routes.draw do
  get 'charges/new'

  get 'charges/create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get 'home/home', to: "home#home", as: "home"
  get 'home/signup', to: "home#signup", as: "signup"
  get 'home/login', to: "home#login"
  get 'home/aboutus', to: "home#aboutus", as: "aboutus"
  get 'home/services', to: "home#services", as: "services"
  get 'home/faq', to: "home#faq", as: "faq"
  get 'home/tos', to: "home#tos", as: "tos"
  get 'home/pp', to: "home#pp", as: "pp"
  get 'home/sitemap', to: "home#sitemap", as: "sitemap"
  get 'teenagers/new', to: "teenagers#new", as: "new"

  post 'client_requests/:id/match_applicant/:matched_id', to: 'client_requests#match_applicant', as: :match
  patch 'client_requests/:id/progress', to: 'client_requests#update_progress', as: :progress
  patch 'client_requests/:id/rating', to: 'client_requests#update_rating', as: :rating
  post 'client_requests/:id/auto_match', to: 'client_requests#auto_match', as: :auto_match

  root "home#home"

  get 'customer_service/index'
  post 'customer_service/submit_feedback'#, to: 'customer_service#submit_feedback'
  #get 'customer_service/submit_feedback'#, to: 'customer_service#submit_feedback'
  get 'teenagers/new'
  get 'teenagers/sign_in'
  post 'teenagers/sign_in', to: 'teenagers#verify'
  get 'clients/sign_in'
  post 'clients/sign_in', to: 'clients#verify'
  get 'clients/sign_out'
  resources :users
  resources :charges, only: [:new, :create]
  #devise_for :users
  resources :teenagers
  resources :clients
  resources :profiles
  resources :teen_offerings
  resources :client_requests do
    resources :applicants
  end
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
