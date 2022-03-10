Rails.application.routes.draw do
  devise_for :users
  root to: 'page#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms do
    resources :matchs
  end

  resources :answers, only: [:index, :show, :new, :create]
end
