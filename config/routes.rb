Rails.application.routes.draw do
  devise_for :users
resources :repairs
namespace :api do
    resources :users
    resources :repairs
    get :search, controller: "repairs", action: "search"
  end
post "/controllers/mailers/user_mailer" => "user_mailer#send_alert_mail"
root to: "users#main"
end
