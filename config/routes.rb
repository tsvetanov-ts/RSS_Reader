Rails.application.routes.draw do
  resources :feeds
  root 'feeds#index'
  resources :feeds do
    member do
      resources :entries, only: [:index, :show]
    end
  end

  resources :news

end
