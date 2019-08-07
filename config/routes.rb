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
    resources :images, controller: "tweet_images",:only => [:index, :show, :new, :create, :destroy] 
    patch "like", "unlike", on: :member
    get "favo", "followTweet","search", on: :collection
    resource :likes, only: [:create, :destroy]
  end
  resources :relationships, only:[:create, :destroy]
end
