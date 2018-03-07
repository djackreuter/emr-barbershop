Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'barbershops#index'
  resources :barbershops do
    resources :users
    resources :appointments, only: [:create, :index, :new]
  end
  resources :users do
    member do
      get :confirm_email
    end
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/barbershop_logout', to: 'sessions#barbershop_logout', as: :barbershop_logout
  get '/sessions/verify', to: 'sessions#verify', as: :verify
  post '/sessions/verify', to: 'sessions#check_2fa', as: :check_2fa
  post '/sessions/select_barbershop/:barbershop_id', to: 'sessions#select_barbershop', as: :select_barbershop
end
