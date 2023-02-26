Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams do
    get "join" => "teams#join"
  end
end
