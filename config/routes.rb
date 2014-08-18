Rails.application.routes.draw do
	root "homepage#index"

	get "/signin", to: "sessions#new"
	post "/signin", to: "sessions#create"

	resources :users, only: [:edit, :update, :show]

	namespace :faculty do
		root :to => "base#index"
		resources :posts
	end

	namespace :admin do
		root :to => "base#index"
		resources :users
		resources :events
		resources :tuitions, except: :destroy
	end
end
