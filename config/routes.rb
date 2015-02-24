Rails.application.routes.draw do
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
