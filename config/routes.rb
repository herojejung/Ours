Rails.application.routes.draw do
root 'user/homes#top'

devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions',
  passwords: 'users/passwords'
}

devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  get 'users/sign_out', to: 'devise/sessions#destroy'
end

devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admins/sessions"
}

  namespace :user do
    resources :users do
        member do
      patch :withdrawal # withdrawalアクションのルートを定義
      end
    end
    resources :post_images do
    resources :comments, only:[:create,:index,:destroy]
    resources :likes, only:[:create,:destroy]
  end
    resources :categories
    resources :sub_categories, only:[:index]
end

namespace :admin do
  root to: 'homes#top'
  get "destroy/admin/session" => "admin#sign_out"
  resources :users, only:[:index,:show,:destroy]
  resources :post_images do
    resources :comments
    resources :likes, only:[:create,:destroy]
    resources :homes
  end
  resources :categories do
    resources :sub_categories, only:[:create,:update,:destroy]
  end
end

get '/font-awesome/css/font-awesome.css', to: 'controller#action'

end
