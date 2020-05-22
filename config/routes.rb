Rails.application.routes.draw do
  get 'pages/top'

  resources :book
end
