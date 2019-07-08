Rails.application.routes.draw do
  thing_sort_regex = /hot|new|top|controversy/
  thing_date_regex = /day|week|month/
  thing_type_regex = /posts|comments/
  vote_type_regex = /ups|downs/
  mod_queue_type_regex = /new|reports/

  concern :searchable do
    post "search", on: :collection
  end

  concern :confirmable do
    get 'confirm', on: :member
  end

  concern :mod_queue do |options|
    resource :mod_queue, { only: [] }.merge(options) do
      get "(/:mod_queue_type)(/:thing_type)", action: :show, as: "", constraints: { mod_queue_type: mod_queue_type_regex, thing_type: thing_type_regex }, defaults: { mod_queue_type: "all", thing_type: "all" }
    end
  end

  root "home#index", thing_sort: "hot", thing_date: "all"

  get "/:thing_sort(/:thing_date)", to: "home#index", as: :home, constraints: { thing_sort: thing_sort_regex, thing_date: thing_date_regex }, defaults: { thing_date: "all" }

  resource :sign_up, only: [:new, :create], controller: :sign_up
  resource :sign_in, only: [:new, :create], controller: :sign_in
  resource :forgot_password, only: [:new, :create], controller: :forgot_password
  resource :password, only: [:edit, :update], controller: :password
  resource :sign_out, only: [:destroy], controller: :sign_out
  resource :user_settings, only: [:edit, :update], path: :settings

  resources :bookmarks, only: [] do
    get "(/:thing_type)", action: :index, as: "", on: :collection, constraints: { thing_type: thing_type_regex }, defaults: { thing_type: "all" }
  end

  resources :votes, only: [] do
    get "(/:vote_type)(/:thing_type)", action: :index, as: "", on: :collection, constraints: { vote_type: vote_type_regex, thing_type: thing_type_regex }, defaults: { vote_type: "all", thing_type: "all" }
  end

  resources :users, only: [], path: "/u" do
    get "(/:thing_type)(/:thing_sort)(/:thing_date)", action: :show, as: "", on: :member, constraints: { thing_type: thing_type_regex, thing_sort: thing_sort_regex, thing_date: thing_date_regex }, defaults: { thing_type: "all", thing_sort: "new", thing_date: "all" }

    resources :user_notifications, only: [:index], as: :notifications, path: :notifications

    concerns :mod_queue, controller: :user_mod_queue
  end

  get "/post/new", to: "post#new", as: :post_new

  post "/things_actions", to: "things_actions#index", as: :things_actions

  resources :blacklisted_domains, except: [:show, :edit, :update], concerns: [:searchable, :confirmable]
  resources :rules, except: [:show], concerns: [:confirmable]
  resources :deletion_reasons, except: [:show], concerns: [:confirmable]
  resources :pages, concerns: [:confirmable]
  resources :bans, except: [:show], concerns: [:searchable, :confirmable]
  resources :logs, only: [:index]

  resources :subs, only: [:index, :edit, :update], path: "/r" do
    get "(/:thing_sort)(/:thing_date)", action: :show, as: "", on: :member, constraints: { thing_sort: thing_sort_regex, thing_date: thing_date_regex }, defaults: { thing_sort: "hot", thing_date: "all" }

    resources :texts, only: [:new, :edit, :create, :update]
    resources :links, only: [:new, :create]
    resources :medias, only: [:new, :create]

    concerns :mod_queue, controller: :sub_mod_queue

    resources :contributors, except: [:show, :edit, :update], concerns: [:searchable, :confirmable], controller: :sub_contributors
    resources :moderators, except: [:show], concerns: [:searchable, :confirmable], controller: :sub_moderators
    resources :tags, except: [:show], concerns: [:confirmable], controller: :sub_tags
    resource :follow, only: [:create, :destroy], controller: :sub_follow
  end

  resources :things, only: [:show], path: "/t" do
    resource :approve_things, only: [:create], as: :approve, path: :approve
    resource :delete_things, only: [:new, :create], as: :delete, path: :delete
    resource :votes, only: [:create]
    resource :bookmarks, only: [:create, :destroy]
    resource :specify_things, only: [:create, :destroy], as: :specify, path: :specify
    resource :spoiler_things, only: [:create, :destroy], as: :spoiler, path: :spoiler
    resource :tag_things, only: [:edit, :update], as: :tag, path: :tag
    resources :report_things, only: [:index, :new, :create], as: :reports, path: :reports
    resource :thing_subscriptions, only: [:create, :destroy], as: :subscription, path: :subscription
    resource :ignore_thing_reports, only: [:create, :destroy], as: :ignore_reports, path: :ignore_reports
    resource :comments, only: [:new, :create, :edit, :update, :destroy], as: :comment, path: :comment
  end

  match "*path", via: :all, to: "page_not_found#show"
end