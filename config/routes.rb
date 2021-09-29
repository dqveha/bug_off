Rails.application.routes.draw do
  resources :users, only: [:index, :edit, :destroy, :update]
  resources :bug_tickets

  root to: "welcome#home"
  
  get 'welcome/home'

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
