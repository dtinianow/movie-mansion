Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :showtimes, only: [:index]
  resources :orders, only: [:new, :create]

  namespace :admin do
    namespace :movies do
      get ':id/orders', to: 'orders#index', as: 'orders'
    end

    namespace :auditoriums do
      get ':id/showtimes', to: 'showtimes#index', as: 'showtimes'
    end

    resources :orders, only: [:index]
    resources :movies, only: [:index]
    resources :auditoriums, only: [:index, :edit]
  end
end
