Rails.application.routes.draw do
  root to: 'articles#random'
  resources :articles, only: [:index, :show]
end
