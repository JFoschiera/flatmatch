Rails.application.routes.draw do

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }



  root to: 'rooms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms do
    resources :deals
  end
end
