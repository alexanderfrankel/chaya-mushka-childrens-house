Rails.application.routes.draw do
	root "homepage#index"

	get "/signin", to: "sessions#new"
	post "/signin", to: "sessions#create"
	delete "/signout", to: "sessions#destroy", as: "signout"

	resources :users, only: [:new, :create, :edit, :update, :show]
	resources :events, only: [:index, :show]
	resources :tuitions, only: :index
	resources :staff, only: [:index, :show]
	resources :forms, only: [:index, :show]

	namespace :faculty do
		root :to => "base#index"
		resources :posts, except: :index
	end

	namespace :admin do
		root :to => "base#index"
		resources :posts, except: :index
		resources :users
		resources :events
		resources :forms
		resources :tuitions, except: :destroy
	end
end
