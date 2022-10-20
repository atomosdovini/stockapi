require 'sidekiq/web'
Rails.application.routes.draw do
    # mount Sidekiq::Web => '/sidekiq'
    resources :tickets
    resources :prices
    post '/prices/ticket', to: 'prices#list_stocks'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
