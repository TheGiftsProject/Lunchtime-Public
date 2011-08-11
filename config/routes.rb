LunchTime::Application.routes.draw do

  resources :restaurants
  resources :tags
  match "no_site" => "static#no_site"

  scope "/:company_url" do
    resources :users
    match 'vote' => "lunch#vote"
    match "open_lunch" => "lunch#open_lunch"
    match "close_lunch" => "lunch#close_lunch"
    match "no_user" => "static#no_user"
    match "no_admin" => "static#no_admin"
    root :to => "lunch#show",:as=>"action"
  end

  root :to => "static#welcome"

end
