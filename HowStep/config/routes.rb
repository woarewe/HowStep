Rails.application.routes.draw do


  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: 'home#index'

  resources :users, except: [:new]

  resources :posts do
    resources :steps, except: [:index, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
