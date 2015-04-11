Rails.application.routes.draw do
  root 'shows#index'
  devise_for :users

  resources :venues do
    resources :shows
  end

  resources :bands do
    resources :shows
  end
end
