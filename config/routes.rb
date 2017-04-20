Rails.application.routes.draw do
  get 'items/create'

  # Route root path thru the home controller to the index page
  root 'home#index'

  # Other HomeController routes
  get 'about' => 'home#about'
  get 'faq' => 'home#faq'
  get 'contact' => 'home#contact'
	
	# User routes. Show separate because devise only handles login, registration, etc., not profile viewing.
	devise_for :users, controllers: { sessions: 'users/sessions' }
	resources :users, only: [:show]
	
	# Item routes, nested under users
	resources :users, only: [] do
		resources :items, only: [:create, :destroy]
	end
end
