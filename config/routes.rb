Rails.application.routes.draw do
  get 'about/show'

  devise_for :users
  resources :projects do
    resources :comments
  end
  root 'projects#index'
end
