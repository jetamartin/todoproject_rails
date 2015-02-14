Rails.application.routes.draw do
  match('to_dos', {:via => :get, :to => 'to_dos#index'})
  match('to_dos/:id', {:via => :get, :to => 'to_dos#show'})
  match('to_dos/:id', {via: [:patch, :put], to: 'to_dos#update'})
end
