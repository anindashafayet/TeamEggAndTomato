Rails.application.routes.draw do
  get 'customer_service/index'
  post 'customer_service/submit_feedback'#, to: 'customer_service#submit_feedback'
  #get 'customer_service/submit_feedback'#, to: 'customer_service#submit_feedback'
  get 'teenagers/new'
  get 'teenagers/sign_in'
  post 'teenagers/sign_in', to: 'teenagers#verify' 
  resources :teenagers
  resources :profiles
  resources :teen_offerings
  resources :client_requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
