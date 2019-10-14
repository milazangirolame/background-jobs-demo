require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # Sidekiq Web UI, only for admins.

  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
