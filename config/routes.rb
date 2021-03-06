Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :appellation_wineries

  resources :wine_cellars
  resources :my_wine_cellars do
    resources :wines
    resources :wineries
    resources :my_wineries
  end

  resources :my_wineries
  resources :stocks
  resources :wines
  resources :appellations
  resources :wineries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
