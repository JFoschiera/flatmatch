Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               omniauth_callbacks: 'users/omniauth_callbacks',
              }
  devise_scope :user do
    get 'about', to: 'devise/sessions#about'
    get 'phone', to: 'devise/sessions#phone'
    get 'profile', to: 'devise/sessions#profile'
    get 'my-rooms', to: 'devise/sessions#my_rooms'
  end


  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms do
    resources :likes
  end

  resources :abouts, only: [:new, :create]
  resources :answers, only: [:new, :create, :show, :index, :destroy]
  resources :phones, only: [:new, :create]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

end
