Rails.application.routes.draw do
devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
namespace :user do
  get 'comments/destroy'
  get 'comments/create'
end
  
end
