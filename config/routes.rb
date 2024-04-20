# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'contacts/new'
  # get 'contacts/create'
  root 'static_pages#home'
  resources :contacts, only: %i[new create]
  get    '/projects', to: 'static_pages#works'
  get    '/publication', to: 'static_pages#publication'
  get    '/contact', to: 'contacts#new'
  get    '/about', to: 'static_pages#about'
  get 'resume', to: 'static_pages#download_pdf'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
