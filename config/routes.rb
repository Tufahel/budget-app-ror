Rails.application.routes.draw do
  get 'splash_screens/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash_screens#index"
  resources :categories do
    resources :deals
  end
end
