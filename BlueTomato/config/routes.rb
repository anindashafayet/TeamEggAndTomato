Rails.application.routes.draw do
  get 'home/home', to: "home#home", as: "home"
  get 'home/signup', to: "home#signup", as: "signup"
  get 'home/login', to: "home#login", as: "login"
  get 'home/aboutus', to: "home#aboutus", as: "aboutus"
  get 'home/profile', to: "home#profile", as: "profile"
  get 'home/services', to: "home#services", as: "services"
  get 'home/faq', to: "home#faq", as: "faq"
  get 'home/tos', to: "home#tos", as: "tos"
  get 'home/pp', to: "home#pp", as: "pp"
  get 'home/sitemap', to: "home#sitemap", as: "sitemap"
  get 'teenagers/new', to: "teenagers#new", as: "new"

  get 'customer_service/index'
  post 'customer_service/submit_feedback'#, to: 'customer_service#submit_feedback'
  #get 'customer_service/submit_feedback'#, to: 'customer_service#submit_feedback'
  get 'teenagers/new'
  get 'teenagers/sign_in'
  post 'teenagers/sign_in', to: 'teenagers#verify' 
  get 'clients/sign_in'
  post 'clients/sign_in', to: 'clients#verify' 
  resources :teenagers
  resources :clients
  resources :profiles
  resources :teen_offerings
  resources :client_requests
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
