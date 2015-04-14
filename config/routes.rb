Rails.application.routes.draw do
  root 'shows#index'
  devise_for :users

  resources :venues, only: [:index, :show, :create] do
    resources :shows
  end

  resources :bands, only: [:index, :show]
end
