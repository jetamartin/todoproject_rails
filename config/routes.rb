Rails.application.routes.draw do
  match('to_dos', {:via => :get, :to => 'to_dos#index'})
end
