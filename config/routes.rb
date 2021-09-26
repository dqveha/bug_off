Rails.application.routes.draw do
  resources :forms
  get 'welcome/home'
  devise_for :users
  
  root to: "welcome#home"
end
