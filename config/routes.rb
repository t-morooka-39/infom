Rails.application.routes.draw do
  
  
  devise_for :members,controllers: {
    registrations: 'members/registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "top#index"
  resources :members,:only => [:index, :show]  do
    get :following, :followers, on: :member
  end
  resources :tweets do
    get "favo", "follow_tweet","search", "mine", "rank", on: :collection
    resource :likes, only: [:create, :destroy]
  end
  resources :relationships, only:[:create, :destroy]
  resources :comments, only:[:create, :destroy]
  resources :health_check, only: [:index]

  namespace :admin do
    resources :members, :only => [:index, :destroy] do 
      get :cancel, on: :member
    end
  end
end
