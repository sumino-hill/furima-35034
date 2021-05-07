Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
  end
end
