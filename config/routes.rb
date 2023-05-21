Rails.application.routes.draw do
  get 'topics/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  ExceptionHunter.routes(self)
  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations: 'api/v1/registrations',
    sessions: 'api/v1/sessions',
    passwords: 'api/v1/passwords'
  }

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get :status, to: 'api#status'

      devise_scope :user do
        resource :user, only: %i[update show]
      end
      resources :settings, only: [] do
        get :must_update, on: :collection
      end
      
      # TOPICS CONTROLLER ROUTES
      get :topics, to: 'topics#index'
      get 'topics/show'
      post :topics, to: 'topics#create'
      get 'topics/update'
      get 'topics/destroy'

      # TARGETS CONTROLLERS ROUTES
      resources :targets, only: [:index, :create, :show, :update, :destroy] do
        get :targets, to: 'targets#index'
        get 'targets/show'
        post :targets, to: 'targets#create'
        get 'targets/update'
        delete :targets,  only: [:destroy]
      end
    end
  end
end
