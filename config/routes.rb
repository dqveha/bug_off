# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects
  resources :users, only: %i[index edit destroy update]
  resources :bug_tickets do
    member do
      get 'versions', to: 'bug_tickets#versions'
    end
  end

  root to: 'welcome#home'

  get 'welcome/home'

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
