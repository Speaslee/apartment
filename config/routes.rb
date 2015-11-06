Rails.application.routes.draw do
  devise_for :users
resources :repairs
namespace :api do
    resources :users
    resources :repairs
    get :search, controller: "repairs", action: "search"
  end

root to: "users#main"
end
