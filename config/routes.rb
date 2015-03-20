Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
  # get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
end
  root to: 'to_dos#index'
  resources :to_dos do
    # resources :tasks  (need this line and not next three lines when I do nested resources)
    member do
      get 'new_task'
    end
  end
  resources :tasks
  # match('to_dos', {:via => :get, :to => 'to_dos#index'})
  # match('to_dos/:id', {:via => :get, :to => 'to_dos#show'})
  # match('to_dos/:id', {via: [:patch, :put], to: 'to_dos#update'})
  # match('to_dos/:id', {:via => :get, :to => 'tasks#show'})
end
