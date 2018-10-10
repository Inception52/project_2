Rails.application.routes.draw do
  get    '/createc', to: 'companies#new'
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'houses/find'
  post 'houses/search'
  resources :users
  resources :companies
  resources :houses
  resources :inquries
  resources :pbuyers
end
