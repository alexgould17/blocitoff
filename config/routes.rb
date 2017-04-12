Rails.application.routes.draw do
  # Route root path thru the home controller to the index page
  root 'home#index'

  # Other HomeController routes
  get 'about' => 'home#about'
  get 'faq' => 'home#faq'
  get 'contact' => 'home#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
