Rails.application.routes.draw do

devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}

devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
end

devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

namespace :user do
  root to: 'homes#index'
  resources :users, only:[:show,:edit,:update,:index]
  get '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  resources :comments, only:[:destroy,:create]
  resources :likes, only:[:index,:create,:destroy,:show]
  resources :post_images, only:[:index,:edit,:new,:create,:show]
end

namespace :admin do
  root to: 'homes#top'
  get "destroy/admin/session" => "admin#sign_out"
  resources :users, only:[:show,:edit,:update,:index]
  resources :post_images, only:[:edit,:destroy,:show]
end

end
