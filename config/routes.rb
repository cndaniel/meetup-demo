Rails.application.routes.draw do
  devise_for :users
  resources :meetups, only: [:index, :show, :create, :new] do
    resources :comments, only: :create
  end

  root "meetups#index"
end
