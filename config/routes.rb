Rails.application.routes.draw do
  root 'shows#index'
  devise_for :users
  
  resources :venues, only: [:index, :show] do
    resources :shows, only: [:index, :show]
  end

  resources :bands, only: [:index, :show] do
    resources :shows, only: [:index, :show]
  end
end
