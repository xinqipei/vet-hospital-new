Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "pages#home"

  resources :profiles
  resources :pets, only: [:index, :new, :create, :destroy, :update, :edit, :show] do
    member do
      get 'edit'
      post 'edit'
      post 'show'
      patch 'show'
    end



    resources :appointments, only: [:index,:new, :create, :destroy, :edit]
  end

  resources :profiles, only:[:index, :new, :create, :destroy, :update, :edit, :show] do
    member do
      get 'edit'
      post 'edit'
      end
    resources :notes
  end
end
