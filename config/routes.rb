Rails.application.routes.draw do
  root 'static_pages#home'
  get    '/projects',    to: 'static_pages#works'
  get    '/publication',    to: 'static_pages#publication'
  get    '/contact',    to: 'static_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
