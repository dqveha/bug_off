Rails.application.routes.draw do
  resources :bug_tickets
  root to: "welcome#home"
  
  get 'welcome/home'
  get 'admin/index'
  
  devise_for :users
end
