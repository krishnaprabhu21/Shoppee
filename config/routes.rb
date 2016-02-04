Rails.application.routes.draw do

	devise_for :users 

	root :to => 'welcome#index'

	resources :products

	resources :offers

	get '/products', to: 'products#index', as: 'dashboard'

	resources :user

  
end
