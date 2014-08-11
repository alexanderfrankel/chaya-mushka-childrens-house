Rails.application.routes.draw do
	root "posts#index"

	resources :posts

	resources :users, only: [:edit, :update, :show]

	get "/signin", to: "sessions#new"
	post "/signin", to: "sessions#create"

	namespace :admin do
		root :to => "base#index"
		resources :users
	end
end
