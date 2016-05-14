Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :comments
  end
  root 'projects#index'
end
