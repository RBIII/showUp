Rails.application.routes.draw do
  root 'shows#index'
  devise_for :users

  resources :venues do
    resources :bands do
      resources :shows
    end
  end

  # resources :bands do
  #   resources :shows
  # end
end
