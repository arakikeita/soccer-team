Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams do
    get "join" => "teams#join"
    get "main" => "teams#main_index"
    delete "all_destroy" => 'teams#all_destroy' ##チーム削除機能 → destroyチーム退会機能で使用している為使えない。
  end
  resources :users, only: :show
  resources :calenders do
    resources :attends, only: [:create,:destroy]
  end
  resources :games do
    collection do
      get 'search'
    end
    resources :comments, only: [:create,:desetroy]
  end
end
