Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :showtimes, only: [:index]
  resources :orders, only: [:new, :create]

  namespace :admin do
    resources :orders, only: [:index]
  end
end
