Rails.application.routes.draw do
	root "posts#index"

	resources :posts

	resources :users, only: [:edit, :update, :show]
end
