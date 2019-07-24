Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :events, only: %i[index show] do
        resource :tickets, only: %i[create show]
      end
    end
  end
end
