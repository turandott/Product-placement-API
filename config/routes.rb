Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # get 'tokens/create'
      resources :tokens, only: [:create]
    end
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show create update destroy]
    end
  end
end
