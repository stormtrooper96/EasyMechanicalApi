Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/', :to => redirect('/index.html')
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  resources :operators
  post 'auth/operator', to: 'authentication#authenticateOperator'
  post 'signupOperator', to: 'operators#create'
  post 'activeBookings', to: 'bookings#showRidesByRating'
  
  resources :booking_statuses 
  resources :statuses 
  resources :services
  resources :bookings 
end
