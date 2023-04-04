Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :recipes do
    member do
      patch :update
      patch :toggle_public
    end
  end

  get '/', to: 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
