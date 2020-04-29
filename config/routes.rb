Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :boards, only: %i[show] do
    resources :thres, only: %i[new create]
  end
  resources :thres, only: %i[show] do
    resources :replies, only: %i[create]
  end
end
