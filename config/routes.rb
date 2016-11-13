Rails.application.routes.draw do
  root "cocktails#index"
  mount Attachinary::Engine => "/attachinary"

  resources :cocktails do
    collection do
      get 'recent', to: "cocktails#recent"
    end
    resources :doses, only: [:index, :create, :new, :destroy], shallow: true
  end
end
