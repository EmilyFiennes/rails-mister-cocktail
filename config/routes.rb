Rails.application.routes.draw do
  root "cocktails#index"

  resources :cocktails do
    resources :doses, only: [:index, :create, :new, :destroy], shallow: true
  end


end
