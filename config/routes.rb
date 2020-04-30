Rails.application.routes.draw do
  root to: 'static_pages#top'
  get 'search', to: 'searchables#search'
  resources :boards, only: %i[show] do
    resources :thres, only: %i[new create]
  end
  resources :thres, only: %i[show] do
    resources :replies, only: %i[create]
  end
end
