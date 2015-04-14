Rails.application.routes.draw do
  root 'shows#index'
  devise_for :users

  resources :venues, only: [:index, :show] do
    resources :reviews, only: [:create]
  end

  resources :shows, only: [:index, :show] do
    resources :reviews, only: [:create]
  end

  resources :bands, only: [:index, :show] do
    resources :reviews, only: [:create]
  end
end
