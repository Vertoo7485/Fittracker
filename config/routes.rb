# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resource :session, only: %i[new create destroy]

    resources :users, only: %i[new create edit update show] do
      resources :powers, except: %i[index]
      put '/powers/:id/update_power', to: 'powers#update_power', as: 'update_power'
      resources :crossfits, except: %i[index]
      put '/crossfits/:id/update_crossfit', to: 'crossfits#update_crossfit', as: 'update_crossfit'
    end

    namespace :admin do
      resources :users, only: %i[index create]
    end
    root 'pages#index'
  end
end
