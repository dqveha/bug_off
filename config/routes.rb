Rails.application.routes.draw do
  resources :forms
  get 'pages/home'
  devise_for :users
  
  root to: "pages#home"
end
