Rails.application.routes.draw do
  root "home#index"


  resources :employees
  resources :students
  resources :documents

  # public pages routes
  get "about-us"=> "pages#about_us"
  get "contact-us"=>"pages#contact_us"
  get "privacy-policy" => "pages#privacy_policy"
  get "terms-condition"=>"pages#terms_condition"
  get "up" => "rails/health#show", as: :rails_health_check
  get "profile/index"
  # get "home/index"
  # get "/home" => "home#index"
end
