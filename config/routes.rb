Rails.application.routes.draw do
  resources :tickets
  resources :prices
  post '/prices/ticket', to: 'prices#list_stocks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
