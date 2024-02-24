# frozen_string_literal: true

require 'sidekiq/web'

class AdminConstraint
  def matches?(request)
    user_id = request.session[:user_id] || request.cookie_jar.encrypted[:user_id]

    User.find_by(id: user_id)&.admin_role?
  end
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq', constraints: AdminConstraint.new

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resource :session, only: %i[new create destroy]

    resource :password_reset, only: %i[new create edit update]

    resources :users, only: %i[new create edit update show] do
      resources :powers, except: %i[index]
      put '/powers/:id/update_power', to: 'powers#update_power', as: 'update_power'
      resources :crossfits, except: %i[index]
      put '/crossfits/:id/update_crossfit', to: 'crossfits#update_crossfit', as: 'update_crossfit'
      resources :gains, except: %i[index]
      put '/gains/:id/update_gain', to: 'gains#update_gain', as: 'update_gain'
      resources :photos, only: %i[index new create]
      resources :batmen, except: %i[index]
      put '/batmen/:id/update_batman', to: 'batmen#update_batman', as: 'update_batman'
      resources :wolverines, except: %i[index]
      put '/wolverines/:id/update_wolverine', to: 'wolverines#update_wolverine', as: 'update_wolverine'
      resources :spiders, except: %i[index]
      put '/spiders/:id/update_spider', to: 'spiders#update_spider', as: 'update_spider'
    end

    get '/faq', to: 'pages#faq'
    get '/training', to: 'pages#training'

    namespace :admin do
      resources :users, only: %i[index create edit update destroy]
    end
    root 'pages#index'
  end
end
