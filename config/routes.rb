Rails.application.routes.draw do
  
  
  devise_for :members,controllers: {
    registrations: 'members/registrations',
    #他にもカスタマイズするコントローラーがあればここに記述する
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "top#index"
  resources :members
  resources :tweets do
    resources :images, controller: "tweet_images",:only => [:index, :show, :new, :create, :destroy] 
  end
end
