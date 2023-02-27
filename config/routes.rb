Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams do
    get "join" => "teams#join"
    delete "all_destroy" => 'teams#all_destroy' ##チーム削除機能 → destroyチーム退会機能で使用している為使えない。
  end
end
