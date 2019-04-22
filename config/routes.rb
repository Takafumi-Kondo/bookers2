Rails.application.routes.draw do

  	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'books#index'#ログイン後マイページ
	resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

	resources :users, only: [:show, :edit, :index, :update]

	get 'users/index' => 'users#index'

end
