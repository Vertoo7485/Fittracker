# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resource :session, only: %i[new create destroy]

    resources :users, only: %i[new create edit update show] do
      resources :powers, except: %i[index]
      put '/powers/:id/update_power', to: 'powers#update_power', as: 'update_power'
      resources :crossfits, except: %i[index]
      put '/crossfits/:id/update_crossfit', to: 'crossfits#update_crossfit', as: 'update_crossfit'
      resources :tabats, except: %i[index]
      put '/tabats/:id/update_tabat', to: 'tabats#update_tabat', as: 'update_tabat'
      resources :gains, except: %i[index]
      put '/gains/:id/update_gain', to: 'gains#update_gain', as: 'update_gain'
    end

    namespace :admin do
      resources :users, only: %i[index create edit update destroy]
    end
    root 'pages#index'
  end
end
