Rails.application.routes.draw do
  match('to_dos', {:via => :get, :to => 'to_dos#index'})
  match('tasks', {:via => :get, :to => 'tasks#index'})
  match('tasks/:id', {via: [:patch, :put], to: 'tasks#update'})
end
