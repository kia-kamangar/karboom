Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :companies
      resources :advertisings
      resources :skills
      resources :resumes
      resources :users
      resources :demands
    end
  end

  devise_for :users, controllers: { sessions: 'sessions'}, defaults: { format: 'json' }
  get "(*path)", to: "application#app"
  # devise_for :users
end
