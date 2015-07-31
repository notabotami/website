BastaScheduler::Application.routes.draw do



  resources :users
  resources :user_ranks


  get '/home', to: 'home#home'
  get '/about', to: 'about#about'
  get '/services', to: 'services#services'
  get '/questions_and_answers', to: 'questions_and_answers#questions_and_answers'
  get '/privacy', to: 'privacy#privacy'
  get '/location', to: 'location#location'

  get '/change_language', to: 'application#change_language'
  get '/change_to_english', to: 'application#change_to_english'
  get '/change_to_spanish', to: 'application#change_to_spanish'

  #get '/login', to: 'sessions#login'
  #post '/login_create', to: 'sessions#create'
  #delete '/logout', to: 'sessions#destroy'
  #get '/forgot_password', to: 'sessions#forgot_password'



  get '/user/view_profile', to:'users#view_profile'
  # map '/' to be a redirect to '/current'
  root :to => redirect('/home')
end
