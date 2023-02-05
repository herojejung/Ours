Rails.application.routes.draw do

devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

namespace :admin do
  root to: 'homes#top'
  get "destroy/admin/session" => "admin#sign_out"
end

namespace :admin do
  resources :users, only:[:show,:edit,:update,:index]
end

namespace :admin do
  resources :posts, only:[:edit,:destroy,:show]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
namespace :user do
  root to: "homes#top"
  get "destroy_user_session" => "users#sign_out"
end  
  
namespace :user do
  resources :users, only:[:show,:edit,:update,:index]
  get '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
end  
  
namespace :user do
  resources :comments, only:[:destroy,:create]
end

namespace :user do
  resources :likes, only:[:index,:create,:destroy,:show]
end

namespace :user do
  resources :posts, only:[:index,:edit,:new,:create,:show]
end
  
end
