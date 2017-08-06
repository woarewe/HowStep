Rails.application.routes.draw do


  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: 'home#index'

  resources :users, except: [:new]

  resources :posts do
    resources :steps, except: [:index, :show]
  end

  get 'tags/:tag', to: 'posts#index', as: :tag
  match '*path' => redirect('/'), via: :get

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
