Rails.application.routes.draw do

  resources :stocks
  resources :my_wines
  resources :wines
  resources :appellations
  resources :wineries
  resources :my_wine_cellars
  resources :wine_cellars
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
end
