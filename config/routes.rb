Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  
  get 'people/:id/like/:like_id', to: 'people#show', as: 'user_profile'

  devise_scope :user do
    get 'about', to: 'devise/sessions#about'
    get 'phone', to: 'devise/sessions#phone'
    get 'profile', to: 'devise/sessions#profile'
    get 'presentation', to: 'devise/sessions#presentation'
  end
  
  get 'my-rooms', to: 'pages#my_rooms'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms do
    resources :likes do
      resources :compatibilities, only: [:create]
    end
  end

  resources :abouts, only: [:new, :create]
  resources :answers, only: [:new, :create, :show, :index, :destroy]
  resources :phones, only: [:new, :create]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  post 'chatrooms/:user_id', to: 'chatrooms#create', as: 'chatrooms_create'

end
