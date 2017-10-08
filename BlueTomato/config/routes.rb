Rails.application.routes.draw do
  get 'customer_service/index'
  post 'customer_service/submit_feedback'#, to: 'customer_service#submit_feedback'
  #get 'customer_service/submit_feedback'#, to: 'customer_service#submit_feedback'
  get 'teenagers/new'
  resources :teenagers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
