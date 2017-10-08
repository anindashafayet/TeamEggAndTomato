Rails.application.routes.draw do
  get 'teenagers/new'
  resources :teenagers
  resources :teen_offerings
  resources :client_requests

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
