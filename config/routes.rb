Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations'}
  root to: "home#index"
  resources :profiles,only: [:show, :edit, :update]
end
