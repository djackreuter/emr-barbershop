Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'barbershops#index'
  resources :barbershops
  resources :users do
    member do
      get :confirm_email
    end
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/sessions/verify', to: 'sessions#verify', as: :verify
  post '/sessions/verify', to: 'sessions#check_2fa', as: :check_2fa
end
