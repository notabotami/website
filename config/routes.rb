BastaScheduler::Application.routes.draw do

  get '/home', to: 'home#home'
  get '/about', to: 'about#about'
  get '/services', to: 'services#services'
  get '/questions_and_answers', to: 'questions_and_answers#questions_and_answers'
  get '/privacy', to: 'privacy#privacy'
  get '/location', to: 'location#location'
  get '/contact_us', to: 'contact_us#contact_us'
  post '/contact_us_submit', to: 'contact_us#contact_us_submit'
  get '/employee_application', to: 'employee_application#employee_application'
  post '/employee_application_submit', to: 'employee_application#employee_application_submit'
  get '/contact_email', to: 'email#contact_email'
  get '/employment_email', to: 'email#employment_email'
  get '/itin', to: 'itin#itin'
  get '/same_sex_marriage', to: 'same_sex_marriage#same_sex_marriage'
  get '/photo_gallery', to: 'photo_gallery#photo_gallery'

  get '/change_language', to: 'application#change_language'
  get '/change_to_english', to: 'application#change_to_english'
  get '/change_to_spanish', to: 'application#change_to_spanish'



  #get '/login', to: 'sessions#login'
  #post '/login_create', to: 'sessions#create'
  #delete '/logout', to: 'sessions#destroy'
  #get '/forgot_password', to: 'sessions#forgot_password'



  #get '/user/view_profile', to:'users#view_profile'
  # map '/' to be a redirect to '/current'
  root :to => redirect('/home')
end
