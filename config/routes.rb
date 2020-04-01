Rails.application.routes.draw do
  # get 'contacts/new'
  # get 'contacts/create'
  root 'static_pages#home'
  resources :contacts, only: [:new, :create]
  get    '/projects',    to: 'static_pages#works'
  get    '/publication',    to: 'static_pages#publication'
  get    '/contact',    to: 'contacts#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
