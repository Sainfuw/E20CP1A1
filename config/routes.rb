Rails.application.routes.draw do

	resources :pages, only: [:update, :destroy] do
		collection do
			get :dashboard
		end
	end

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root 'posts#index'
end
