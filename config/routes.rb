Rails.application.routes.draw do
  resources :appellation_wineries
  devise_for :users

  resources :my_wine_cellars do
    resources :my_wines
  end

  resources :stocks
  resources :wines
  resources :appellations
  resources :wineries
  resources :wine_cellars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
end
